//
//  ContentView.swift
//  FactoryPattern
//
//  Created by Sangeeta on 12/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedPizzaType = PizzaType.Margerita
    @State private var pizzaMessage = "Please select a Pizza!"
        
    var body: some View {
        VStack {
            Text(" Pizza Factory ")
                .font(.largeTitle)
                .padding(.top, 50)
            
            //Picker for pizza types
            Picker("Choose your pizza", selection: $selectedPizzaType) {
                ForEach(PizzaType.allCases, id: \.self){ type in
                    Text(type.rawValue)
                        .tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            //Button to order pizza
            Button(action: orderPizza){
                Text("Order Pizza")
                    .font(.headline)
                    
                    .padding()
                    .backgroundStyle(.linearGradient(colors: [.blue.opacity(0.3)], startPoint: .top, endPoint: .bottom ))
            }
        }
        
        //Display pizza message
        Text(pizzaMessage)
            .font(.title2)
            .foregroundStyle(.linearGradient(colors: [.blue.opacity(0.3)], startPoint: .top, endPoint: .bottom ))
            .padding()
        
        Spacer()
        
    }
    
    func orderPizza() {
        if let pizza = PizzaFactory.createPizza(type: selectedPizzaType){
            pizzaMessage = pizza.prepare()
        } else {
            pizzaMessage = "Pizza type not available!"
        }
    }
}

#Preview {
    ContentView()
}
