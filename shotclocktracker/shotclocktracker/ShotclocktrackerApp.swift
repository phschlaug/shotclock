//
//  shotclocktrackerApp.swift
//  shotclocktracker
//
//  Created by Philipp Schlaug on 12.06.23.
//

import SwiftUI

@main
struct ShotclocktrackerApp: App {
    @AppStorage("isOnboarding") var isOnboarding = true
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnBoardingView()
            } else {
                ContentView()
            }
        }
    }
}
