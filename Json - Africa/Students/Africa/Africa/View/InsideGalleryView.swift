//
//  InsideGalleryView.swift
//  Africa
//
//  Created by Nur Irfan Pangestu on 07/07/21.
//

import SwiftUI

struct InsideGalleryView: View {
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15, content: {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            })
        }
        
    }
}

struct InsideGalleryView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsideGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
