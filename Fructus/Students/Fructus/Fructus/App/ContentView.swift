//
//  ContentView.swift
//  Fructus
//
//  Created by Nur Irfan Pangestu on 05/07/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: -  PROPERTIES
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitData
    
    // MARK: -  BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                    
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    Button(
                        action: {
                            isShowingSettings = true
                        }, label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                    )
                    .sheet(isPresented: $isShowingSettings, content: {
                        SettingsView()
                    })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: -  PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitData)
            .previewDevice("iPhone 11 Pro")
    }
}
