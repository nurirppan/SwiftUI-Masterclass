//
//  ButtonModifier.swift
//  Honeymoon
//
//  Created by Nur Irfan Pangestu on 21/07/21.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Capsule().fill(Color.pink))
            .foregroundColor(Color.white)
    }
}
