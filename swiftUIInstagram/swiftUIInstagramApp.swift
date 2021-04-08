//
//  swiftUIInstagramApp.swift
//  swiftUIInstagram
//
//  Created by Levi Davis on 3/19/21.
//

import SwiftUI
import Firebase

@main
struct swiftUIInstagramApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
