//
//  MainView.swift
//  WeSplit
//
//  Created by Brian Sipple on 10/8/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State private var checkAmountString: String = ""
    @State private var numberOfPeopleString = ""
    @State private var tipPercentage = TipPercentageChoice.zero
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Initial Check Amount")) {
                        TextField("Number of Satoshis", text: $checkAmountString)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("Number of People")) {
                        TextField("Number of People Splitting the Check", text: $numberOfPeopleString)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("How much would you like to tip?")) {
                        Picker("Tip Percentage", selection: $tipPercentage) {
                            ForEach(TipPercentageChoice.allCases, id: \.self) { percentage in
                                    Text("\(percentage.rawValue)%")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    
                    if formattedAmountPerPerson != nil && totalCost > 0 {
                        Section(
                            header: HStack {
                                Spacer()
                                Text("Your Split")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.pink)
                                    .padding(.top, 48)
                                    .padding(.bottom, 8 )
                                Spacer()
                            },
                            footer:
                                Text("Total including tip:")
                                    .fontWeight(.bold)
                                + Text(" \(formattedTotalCost) Satoshis")
                        ) {
                            Text("\(formattedAmountPerPerson!) Satoshis")
                        }
                    }
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}


extension MainView {
    private var checkAmount: Double { Double(checkAmountString) ?? 0 }
     
    private var numberOfPeople: Int { Int(numberOfPeopleString) ?? 0 }
    
    private var totalCost: Double {
        checkAmount + (checkAmount * (Double(tipPercentage.rawValue) / 100.0))
    }
     
    private var amountPerPerson: Double? {
        guard numberOfPeople > 0 else { return nil }
        return totalCost / Double(numberOfPeople)
    }
    
    private var formattedAmountPerPerson: String? {
        guard let amountPerPerson = amountPerPerson else { return nil }
        return Currency.formatter.string(from: amountPerPerson as NSNumber)
    }
    
    private var formattedTotalCost: String {
        Currency.formatter.string(from: totalCost as NSNumber) ?? ""
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
