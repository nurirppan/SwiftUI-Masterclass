//
//  AnimalModel.swift
//  Africa
//
//  Created by Nur Irfan Pangestu on 07/07/21.
//

import Foundation
import SwiftUI

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
