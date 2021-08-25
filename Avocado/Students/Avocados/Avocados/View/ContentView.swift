//
//  ContentView.swift
//  Avocados
//
//  Created by Nur Irfan Pangestu on 14/07/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTY
    var headers: [Header] = headersData
    var facts: [Fact] = factsData
    var recipes: [Recipe] = recipesData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 20, content: {
                
                // MARK: - HEADER
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { item in
                            HeaderView(header: item)
                        }
                    }
                }
                
                // MARK: - DISHES
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                DishesView()
                    .frame(maxWidth: 640)
                
                // MARK: - AVOCADOS FACTS
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(alignment: .top, spacing: 60, content: {
                        ForEach(facts) { item in
                            FactsView(fact: item)
                        }
                    }) // HSTACK
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                })
                
                // MARK: - RECIPES CARDS
                Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                VStack(alignment: .center, spacing: 20, content: {
                    ForEach(recipes) { item in
                        RecipeCardView(recipe: item)
                    }
                }) // VSTACK
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                // MARK: - FOOTER
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avocados")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    Text("Everything you wanted to know about avocados but were too afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        .frame(minHeight: 60)
                    
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            })
        })
        .edgesIgnoringSafeArea(.all)
        .padding(0)
    }
}

struct TitleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headersData, facts: factsData, recipes: recipesData)
    }
}
