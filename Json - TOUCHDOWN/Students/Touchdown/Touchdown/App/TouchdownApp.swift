//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Nur Irfan Pangestu on 09/07/21.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
