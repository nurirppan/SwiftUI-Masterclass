//
//  CardModel.swift
//  Learn By Doing
//
//  Created by Nur Irfan Pangestu on 14/07/21.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
