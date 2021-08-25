//
//  RecipeRatingView.swift
//  Avocados
//
//  Created by Nur Irfan Pangestu on 15/07/21.
//

import SwiftUI

struct RecipeRatingView: View {
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...(recipe.rating), id:\.self) { item in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct RecipeRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRatingView(recipe: recipesData[0])
    }
}
