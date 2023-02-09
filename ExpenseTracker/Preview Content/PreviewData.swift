//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by pushkar mondal on 17/01/23.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "17/01/2023", institution: "VIT", account: "Visa", merchant: "Apple", amount: 11, type: "debit", categoryId: 101, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
