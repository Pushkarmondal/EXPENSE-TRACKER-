//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by pushkar mondal on 16/01/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var tlvm: TLVM
    
    var demoData: [Double] = [06.50, 23.86, 2000, 74.92, 10.35, 1000,1000,]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    Text("OVERVIEW")
                        .font(.title2)
                        .bold()
                    
//                    let data = tlvm.accumulatetransaction()
                    
//                    if !data.isEmpty{
//                        let tExpenses = data.last?.1 ?? 0
//
//                        CardView {
//                            VStack{
//                                ChartLabel(tExpenses.formatted(.currency(code:"inr")), type: .title)
//                                    .bold()
//    //                                .background(Color.indigo)
//
//
//                                LineChart()
//                            }
//                            .background(Color.systemBackground)
//                        }
//                        .data(data)
//                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4),Color.blue)))
//                    .frame(height: 300)
//
//                    }
//
//
//tExpenses.formatted(.currency(code:"inr")),
//
//
                    
//                    let tExpenses = data.last?.1 ?? 0

                    CardView {
                        VStack{
                            ChartLabel("MONTHLY LIMIT: 100000 RS", type: .title)
                                .bold()
//                                .background(Color.indigo)


                            LineChart()
                        }
                        .background(Color.cyan)
                    }
                    .data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4),Color.indigo)))
                .frame(height: 300)
                .background(Color.cyan)
                    
                    RecentTransactionList()
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
                
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let tlvm:TLVM = {
       let tlvm = TLVM()
        tlvm.transactions = transactionListPreviewData
        return tlvm
    }()
    
    
    static var previews: some View {
        Group{
            ContentView()
//            
        }
        .environmentObject(tlvm)
    }
}
