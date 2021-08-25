//
//  CodableBundleExtension.swift
//  Touchdown
//
//  Created by Nur Irfan Pangestu on 09/07/21.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        // 1. LOCATE THE JSON FILE
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to lacate \(file) in bundle")
        }
        // 2. CREATE A PROPERTY FOR THE DATA
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        // 3. CREATE A DECODER
        let decoder = JSONDecoder()
        // 4. CREATE A PROPERTY FOR THE DECODE DATA
        guard let decodeData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed decode file from bundle")
        }
        // 5. RETURN THE READY TO USE DATA
        return decodeData
    }
}
