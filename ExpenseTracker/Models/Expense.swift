//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Developer on 2026-09-13.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id = UUID()
    var amount: Double
    var category: String
    var description: String
    var date: Date
    
    enum Category: String, CaseIterable {
        case food = "Food"
        case transport = "Transport"
        case entertainment = "Entertainment"
        case utilities = "Utilities"
        case shopping = "Shopping"
        case other = "Other"
    }
}
