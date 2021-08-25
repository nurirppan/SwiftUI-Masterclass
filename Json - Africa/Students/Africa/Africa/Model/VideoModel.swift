//
//  VideoModel.swift
//  Africa
//
//  Created by Nur Irfan Pangestu on 07/07/21.
//

import Foundation
import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // COMPUTED PROPERTY
    var thumbnail: String {
        "video-\(id)"
    }
}
