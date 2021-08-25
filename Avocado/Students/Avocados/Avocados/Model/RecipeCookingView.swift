//
//  RecipeCookingView.swift
//  Avocados
//
//  Created by Nur Irfan Pangestu on 15/07/21.
//

import SwiftUI

struct RecipeCookingView: View {
    
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 12, content: {
            
            HStack(alignment: .center, spacing: 2, content: {
                Image(systemName: "person.2")
                Text("Serves: \(recipe.serves)")
            }) // HSTACK
            
            HStack(alignment: .center, spacing: 2, content: {
                Image(systemName: "clock")
                Text("Prep: \(recipe.preparation)")
            }) // HSTACK
            
            HStack(alignment: .center, spacing: 2, content: {
                Image(systemName: "flame")
                Text("Cooking: \(recipe.cooking)")
            }) // HSTACK
            
        }) // HSTACK
        .font(.footnote)
        .foregroundColor(Color.gray)
    }
}

struct RecipeCookingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingView(recipe: recipesData[0])
    }
}
