//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by Developer on 2026-09-13.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var viewModel: ExpenseViewModel
    @Binding var isPresented: Bool
    
    @State private var amount: String = ""
    @State private var category: String = "Food"
    @State private var description: String = ""
    @State private var date: Date = Date()
    
    private let categories = ["Food", "Transport", "Entertainment", "Utilities", "Shopping", "Other"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Amount") {
                    HStack {
                        Text("$")
                        TextField("0.00", text: $amount)
                            .keyboardType(.decimalPad)
                    }
                }
                
                Section("Category") {
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { cat in
                            Text(cat).tag(cat)
                        }
                    }
                }
                
                Section("Description") {
                    TextField("Optional notes", text: $description)
                }
                
                Section("Date") {
                    DatePicker(
                        "Select Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                }
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveExpense()
                    }
                    .disabled(amount.isEmpty || Double(amount) == nil)
                }
            }
        }
    }
    
    private func saveExpense() {
        guard let amountValue = Double(amount), amountValue > 0 else { return }
        
        viewModel.addExpense(
            amount: amountValue,
            category: category,
            description: description.isEmpty ? "No notes" : description,
            date: date
        )
        
        isPresented = false
    }
}

#Preview {
    AddExpenseView(
        viewModel: ExpenseViewModel(),
        isPresented: .constant(true)
    )
}
