//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Nur Irfan Pangestu on 21/07/21.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}

