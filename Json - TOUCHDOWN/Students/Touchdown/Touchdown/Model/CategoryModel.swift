//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Nur Irfan Pangestu on 09/07/21.
//

import Foundation
import SwiftUI

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
