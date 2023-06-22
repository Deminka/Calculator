//
//  ContentView.swift
//  Calculator
//
//  Created by mac on 03.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var chechAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(chechAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $chechAmount)
                    Picker("Number of people", selection: $numberOfPeople ){
                        ForEach(2..<100){
                             Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("Сколько чаевых вы хотите оставить?") ) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0]) %")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                Section{
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Калькулятор чаевых", displayMode: .inline)
        }
    }
}


 
































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
