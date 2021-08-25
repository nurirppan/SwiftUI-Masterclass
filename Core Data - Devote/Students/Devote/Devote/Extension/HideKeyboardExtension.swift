//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Nur Irfan Pangestu on 13/07/21.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
