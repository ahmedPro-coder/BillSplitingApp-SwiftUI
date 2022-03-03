//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Mac on 1/2/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    @State private var numberOfPeople = 2
    @State private var tip = 0
    let pourcentages = [0, 15, 20, 25]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tip)
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        print(amount)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of people: ", selection: $numberOfPeople) {
                        ForEach(0..<100) {
                            Text(String($0))
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tip) {
                        ForEach(pourcentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Amout Per Person", content: {
                        Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .foregroundColor(tip == 0 ? .red : .black)
                })
            }.navigationTitle("WeSplit")
        }
    }
}

//@State private var count = 0
//@State private var name = ""
//let choices = ["A", "B", "C"]
//@State private var choice = 0
//var body: some View {
//    NavigationView {
//        Form {
//            Section {
//                TextField("Name", text: $name)
//                Text("Your name is \(name)")
//                Button("Click count: \(count)") {
//                    count += 1
//                }.foregroundColor(.cyan)
//            }
//
//            Section {
//                Picker("Choice: ", selection: $choice) {
//                    ForEach(0..<choices.count) { choice in
//                            Text("Choice \(choice)")
//                    }
//                }
//            }
//        }.navigationTitle("SwiftUI-Form")
//    }.border(.gray, width: 5)
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
