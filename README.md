# iOS Expense Tracker

A simple, elegant iOS expense tracking app built with Swift and SwiftUI.

## Features
- ✅ Log expenses with amount, category, and date
- ✅ View expense list with total spent
- ✅ Delete expenses
- ✅ Local data persistence using UserDefaults
- ✅ Category filtering
- ✅ Clean, intuitive UI

## Requirements
- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/kemoribrown954-stack/ios-expense-tracker.git
   cd ios-expense-tracker
   ```

2. Open in Xcode:
   ```bash
   open ExpenseTracker.xcodeproj
   ```

3. Build and run on simulator or device:
   - Press `Cmd + R` or select Product > Run

## Project Structure
```
ExpenseTracker/
├── Models/
│   └── Expense.swift          # Data model
├── Views/
│   ├── ContentView.swift      # Main view
│   ├── ExpenseListView.swift  # Expense list
│   └── AddExpenseView.swift   # Add new expense
├── ViewModels/
│   └── ExpenseViewModel.swift # State management
└── App/
    └── ExpenseTrackerApp.swift # App entry point
```

## How to Use

1. **Add an Expense**: Tap the "+" button, enter amount, select category, and save
2. **View Expenses**: See all logged expenses sorted by date
3. **Delete Expense**: Swipe left on an expense and tap delete
4. **View Total**: See your total spending at the top

## Future Enhancements
- 📊 Charts and analytics
- 🔔 Budget alerts
- 💾 iCloud sync
- 📤 Export to CSV
- 🎨 Custom categories

## License
MIT License - feel free to use this project however you like!
