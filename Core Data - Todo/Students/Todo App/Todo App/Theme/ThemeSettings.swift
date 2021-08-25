//
//  ThemeSettings.swift
//  Todo App
//
//  Created by Nur Irfan Pangestu on 19/07/21.
//

import Foundation
import SwiftUI

// MARK: - THEME CLASS

// MARK: - NEW CODE (Kudos to Ken Ishimoto from Japan)

final public class ThemeSettings: ObservableObject {
    @Published public var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
        }
    }
    
    private init() {}
    public static let shared = ThemeSettings()
}
