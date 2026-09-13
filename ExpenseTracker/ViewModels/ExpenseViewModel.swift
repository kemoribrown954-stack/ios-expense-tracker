//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Developer on 2026-09-13.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = [] {
        didSet {
            saveExpenses()
        }
    }
    
    private let userDefaultsKey = "expenses"
    
    init() {
        loadExpenses()
    }
    
    // MARK: - Public Methods
    
    func addExpense(amount: Double, category: String, description: String, date: Date) {
        let expense = Expense(
            amount: amount,
            category: category,
            description: description,
            date: date
        )
        expenses.append(expense)
    }
    
    func deleteExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
    
    func deleteExpense(_ expense: Expense) {
        expenses.removeAll { $0.id == expense.id }
    }
    
    func totalExpenses() -> Double {
        expenses.reduce(0) { $0 + $1.amount }
    }
    
    func expensesByCategory(_ category: String) -> [Expense] {
        expenses.filter { $0.category == category }
    }
    
    // MARK: - Private Methods
    
    private func saveExpenses() {
        if let encoded = try? JSONEncoder().encode(expenses) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadExpenses() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([Expense].self, from: data) {
            self.expenses = decoded
        }
    }
}
