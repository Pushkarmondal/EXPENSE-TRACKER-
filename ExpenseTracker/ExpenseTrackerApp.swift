//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by pushkar mondal on 16/01/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
   @StateObject var transactionlistvm = TLVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionlistvm)
        }
    }
}
