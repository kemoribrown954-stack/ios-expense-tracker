//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Developer on 2026-09-13.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ExpenseViewModel()
    @State private var showAddExpense = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    // Header with total
                    VStack(spacing: 8) {
                        Text("Total Spent")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(String(format: "$%.2f", viewModel.totalExpenses()))
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 24)
                    .background(Color(.systemGray6))
                    
                    // Expense list
                    if viewModel.expenses.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "list.bullet.clipboard")
                                .font(.system(size: 48))
                                .foregroundColor(.gray)
                            Text("No Expenses Yet")
                                .font(.headline)
                            Text("Add your first expense to get started")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxHeight: .infinity)
                        .padding()
                    } else {
                        List {
                            ForEach(viewModel.expenses.sorted { $0.date > $1.date }) { expense in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(expense.category)
                                            .font(.headline)
                                        Text(expense.description)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Text(expense.date.formatted(date: .abbreviated, time: .omitted))
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(String(format: "$%.2f", expense.amount))
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                }
                                .padding(.vertical, 4)
                            }
                            .onDelete(perform: viewModel.deleteExpense)
                        }
                        .listStyle(.plain)
                    }
                }
                
                // Add button
                VStack {
                    HStack {
                        Spacer()
                        Button(action: { showAddExpense = true }) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(width: 56, height: 56)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                    Spacer()
                }
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showAddExpense) {
                AddExpenseView(viewModel: viewModel, isPresented: $showAddExpense)
            }
        }
    }
}

#Preview {
    ContentView()
}
