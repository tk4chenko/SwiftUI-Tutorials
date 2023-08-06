//
//  SwiftUI_EssentialsApp.swift
//  SwiftUI Essentials
//
//  Created by Artem Tkachenko on 04.08.2023.
//

import SwiftUI

@main
struct SwiftUI_EssentialsApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
