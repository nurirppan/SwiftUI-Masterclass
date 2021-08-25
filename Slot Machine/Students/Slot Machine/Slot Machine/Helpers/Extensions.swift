//
//  Extensions.swift
//  Slot Machine
//
//  Created by Nur Irfan Pangestu on 16/07/21.
//

import Foundation
import SwiftUI

extension Text {
    
    func scoreLabelStyle() -> Text {
        self
            .foregroundColor(Color.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text {
        self
            .foregroundColor(Color.white)
            .font(.system(.title ,design: .rounded))
            .fontWeight(.heavy)

    }
}
