//
//  Shop.swift
//  Touchdown
//
//  Created by Nur Irfan Pangestu on 12/07/21.
//

import Foundation
import SwiftUI

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
