//
//  CardTransition.swift
//  Honeymoon
//
//  Created by Nur Irfan Pangestu on 21/07/21.
//

import Foundation
import SwiftUI

extension AnyTransition {
    
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}
