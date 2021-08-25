//
//  HeadeDetailView.swift
//  Touchdown
//
//  Created by Nur Irfan Pangestu on 09/07/21.
//

import SwiftUI

struct HeadeDetailView: View {
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            Text("Protective Gear")
            
            Text(shop.selectedProduct?.name ?? sampleProduct.name)
                .font(.largeTitle)
                .fontWeight(.black)
        })
        .foregroundColor(.white)
    }
}

struct HeadeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeadeDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
