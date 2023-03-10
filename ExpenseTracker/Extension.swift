//
//  Extension.swift
//  ExpenseTracker
//
//  Created by pushkar mondal on 17/01/23.
//

import Foundation
import SwiftUI

extension Color{
    static let background = Color("Background")
    static let icon = Color("Item")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUsa: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}


extension String {
    func dateParsed() -> Date {
        guard let parseDate = DateFormatter.allNumericUsa.date(from: self) else {return Date()}
        
        return parseDate
    }
}

extension Date: Strideable{
    func formatted() -> String{
        return self.formatted(.dateTime.year().month().day())
    }
}

extension Double {
    func rounded2digits() -> Double {
        return(self * 100).rounded() / 100
    }
}
