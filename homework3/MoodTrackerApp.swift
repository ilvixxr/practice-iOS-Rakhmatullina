//
//  MoodTrackerApp.swift
//  MoodApp
//
//  Created by Ilvina on 01.07.2026.
//

import SwiftUI

@main
struct MoodTrackerApp: App {
    @State var viewModel = MoodViewModel()
    @AppStorage("userName") var userName: String = ""
    
    var body: some Scene {
        WindowGroup {
            if userName == "" {
                WelcomeView()
            } else {
                MainView()
                    .environment(viewModel)
            }
        }
    }
}

