//
//  FruitModel.swift
//  Fructus
//
//  Created by Nur Irfan Pangestu on 06/07/21.
//

import Foundation
import SwiftUI

// MARK: - FRUIT DATA MODEL

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColor: [Color]
    var description: String
    var nutrition: [String]
}
