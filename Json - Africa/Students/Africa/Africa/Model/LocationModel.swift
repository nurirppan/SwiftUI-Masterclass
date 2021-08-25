//
//  LocationModel.swift
//  Africa
//
//  Created by Nur Irfan Pangestu on 08/07/21.
//

import Foundation
import MapKit

struct NationalPakLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computed Property
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
