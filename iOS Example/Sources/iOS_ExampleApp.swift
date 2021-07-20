//
//  iOS_ExampleApp.swift
//  iOS Example
//
//  Created by Johann Fong on Jul 20, 2021.
//

import SwiftUI

@main
struct iOS_ExampleApp: App {
    
    
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
