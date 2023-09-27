//
//  ResizeApp.swift
//  Resize
//
//  Created by Ulaş Alyeşil on 26.09.2023.
//

import SwiftUI

@main
struct ResizeApp: App {
    
    var body: some Scene {
        MenuBarExtra("Resize", systemImage: "square.resize") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
    }
}
