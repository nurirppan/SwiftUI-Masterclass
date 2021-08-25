//
//  FactModel.swift
//  Avocados
//
//  Created by Nur Irfan Pangestu on 15/07/21.
//

import Foundation
import SwiftUI

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
