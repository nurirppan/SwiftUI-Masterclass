//
//  Modifiers.swift
//  Slot Machine
//
//  Created by Nur Irfan Pangestu on 16/07/21.
//

import Foundation
import SwiftUI

struct ShadowModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 6)
    }
}

struct ButtonModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .accentColor(Color.white)
    }
}

struct ScoreNumberModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: colorTransparentBlack, radius: 0, x: 0, y: 3)
            .layoutPriority(1)
    }
}

struct ScoreContainerModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .frame(minWidth: 128)
            .background(
                Capsule()
                    .foregroundColor(colorTransparentBlack)
            )
    }
}

struct ImageModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 140, idealWidth: 200, maxWidth: 220, minHeight: 130, idealHeight: 190, maxHeight: 200, alignment: .center)
            .modifier(ShadowModifiers())
        
    }
}

struct BetNumberModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .rounded))
            .padding(.vertical, 5)
            .frame(width: 90)
            .shadow(color: colorTransparentBlack, radius: 0, x: 0, y: 3)
        
        
    }
}

struct BetCapsuleModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(
                Capsule()
                    .fill(LinearGradient(gradient: Gradient(colors: [colorPink, colorPurple]), startPoint: .top, endPoint: .bottom))
            )
            .padding(3)
            .background(
                Capsule()
                    .fill(LinearGradient(gradient: Gradient(colors: [colorPink, colorPurple]), startPoint: .bottom, endPoint: .top))
                    .modifier(ShadowModifiers())
            )
    }
}

struct CasinoChipsModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 64)
            .animation(.default)
            .modifier(ShadowModifiers())
    }
}

