//
//  ContentView.swift
//  WeSplit
//
//  Created by Hari's Mac on 23.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var CheckAmount = 0.0
    @State private var numberofPeople = 0
    @State private  var tipPercnetage = 20
    @FocusState private var amountisFocused:Bool
     let tipPercentages = [10,20,5,3,11,0]
    var totalPerperson:Double{
         let peopleCount = Double(numberofPeople+2)
        let tipAmount =     Double(tipPercnetage)
        let tipValue = (CheckAmount * tipAmount)/100
        let  grandTotal = CheckAmount + tipValue
        let amountPerperson = grandTotal/peopleCount
        return amountPerperson
    }
    var totalAmount:Double{
        let tipAmount =     Double(tipPercnetage)
        let tipValue = (CheckAmount * tipAmount)/100
        let  grandTotal = CheckAmount + tipValue
        return grandTotal
    }
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("CheckAmount", value: $CheckAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                        .keyboardType(.decimalPad)
                        .focused($amountisFocused)
                    Picker("Number of Peoples" , selection: $numberofPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much you want to tip?"){
                    
                    Picker("Tip Percentage" , selection: $tipPercnetage){
                        ForEach(0..<101){
                            Text("\($0)%")
                        }
                    }
                    // For forwarding to a new screen to select my data
              //           .pickerStyle(.navigationLink)
                }
                Section("Amount Per Person"){
                    Text(totalPerperson,format:.currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
                Section("Total Amount"){
                    // Update using conditional Modifiers
                        Text(totalAmount,format:.currency(code: Locale.current.currency?.identifier ?? "INR"))
                  
                        .foregroundStyle(tipPercnetage == 0 ? .red: .primary)
                }
            }
            .navigationTitle("We Split")
            .toolbar{
                if amountisFocused{
                    Button("Done"){
                         amountisFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
