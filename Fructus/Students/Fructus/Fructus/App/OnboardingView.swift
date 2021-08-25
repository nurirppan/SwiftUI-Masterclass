//
//  OnboardingView.swift
//  Fructus
//
//  Created by Nur Irfan Pangestu on 06/07/21.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: -  PROPERTIES
    
    var fruit: [Fruit] = fruitData
    
    // MARK: -  BODY
    var body: some View {
        TabView {
            ForEach(fruit[0...5]) { item in
                FruitCardView(fruit: item)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: -  PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruit: fruitData)
            .previewDevice("Iphone 11 Pro")
    }
}
