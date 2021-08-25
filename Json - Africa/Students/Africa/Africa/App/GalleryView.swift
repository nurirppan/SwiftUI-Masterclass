//
//  GalleryView.swift
//  Africa
//
//  Created by Nur Irfan Pangestu on 07/07/21.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let heptics = UIImpactFeedbackGenerator(style: .medium)
    
    // SIMPLE GRID DEFINITION
    // let gridLayout: [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    
    // EFFICIENT GRID DEFINITION
    // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DINAMIC GIRD LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridComlomn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridComlomn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30, content: {
                // MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // MARK: - SLIDER
                Slider(value: $gridComlomn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridComlomn, perform: { value in
                        gridSwitch()
                    })
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                heptics.impactOccurred()
                            }
                    }
                })
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            })
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
