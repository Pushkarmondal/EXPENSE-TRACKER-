//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by pushkar mondal on 09/02/23.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionviewmodel: TLVM
    var body: some View {
        VStack{
            HStack{
                Text("RECENT TRANSACTION")
                    .bold()
                
                Spacer()
                
                NavigationLink{
                    
                    TransactionList()
                    
                }label: {
                    HStack(spacing:4){
                        Text("SEE ALL")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            ForEach(transactionviewmodel.transactions.prefix(6)){ Transaction in
                TransactionRow(transaction: Transaction)
                Divider()
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))
        .shadow(color:Color.primary.opacity(0.2),radius:10,x:0,y:5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let tlvm:TLVM = {
       let tlvm = TLVM()
        tlvm.transactions = transactionListPreviewData
        return tlvm
    }()
    static var previews: some View {
        RecentTransactionList()
            .environmentObject(tlvm)
    }
}
