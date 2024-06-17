//
//  AddView.swift
//  iExpense
//
//  Created by Anushka Mathur on 17/06/24.
//

import SwiftUI

struct AddView: View {
    
    @State private var name: String = ""
    @State private var amount: Double = 0.0
    @State private var type: String = "Personal"
    var expenseObjectPassed: Expenses
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Enter Name Of Expense", text: $name)
                
                Picker("Type Of Expense", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }.pickerStyle(.segmented)
                
                TextField("Amount Spent", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .toolbar{
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenseObjectPassed.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenseObjectPassed: Expenses())
}
