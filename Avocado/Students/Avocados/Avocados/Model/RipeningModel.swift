//
//  RipeningModel.swift
//  Avocados
//
//  Created by Nur Irfan Pangestu on 15/07/21.
//

import Foundation
import SwiftUI

struct Ripening: Identifiable {
    var id = UUID()
    var image: String
    var stage: String
    var title: String
    var description: String
    var ripeness: String
    var instruction: String
}
