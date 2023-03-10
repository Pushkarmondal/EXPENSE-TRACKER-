//
//  Transaction.swift
//  ExpenseTracker
//
//  Created by pushkar mondal on 17/01/23.
//

import Foundation
//import SwiftUI


struct Transaction: Identifiable,Decodable{
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
        
    }
    
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount: -amount
    }
    
    var month: String{
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
    
}
enum TransactionType: String{
    case debit = "DEBIT"
    case credit = "CREDIT"
}
