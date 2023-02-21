//
//  CapselSampleApp.swift
//  CapselSample
//
//  Created by cmStudent on 2022/11/29.
//

import SwiftUI
import Firebase

@main
struct CapselSampleApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}
