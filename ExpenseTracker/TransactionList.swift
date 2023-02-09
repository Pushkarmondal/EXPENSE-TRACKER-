//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by pushkar mondal on 09/02/23.
//

import SwiftUI

struct TransactionList: View {
    
    @EnvironmentObject var transactionlistvm: TLVM
    
    var body: some View {
        VStack{
            List{
                ForEach(Array(transactionlistvm.groupbymonth()),id: \.key) { month,Transaction in
                    
                    Section{
                        
                        ForEach(Transaction) { Transaction in
                            TransactionRow(transaction: Transaction)
                        }
                        
                    } header: {
                        Text(month)
                            .bold()
                    }
                    .listSectionSeparator(.hidden)
                    
                }
            }
            .listStyle(.plain)
            
        }
        .navigationTitle("TRANSACTIONS")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    
    static let tlvm:TLVM = {
       let tlvm = TLVM()
        tlvm.transactions = transactionListPreviewData
        return tlvm
    }()
    
    static var previews: some View {
        Group{
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
            }
        }
        .environmentObject(tlvm)
    }
}
