//
//  SwiftUIWeatherApp.swift
//  Shared
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import SwiftUI

@main
struct SwiftUIWeatherApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var settingsStore = SettingsStore()
    
    var body: some Scene {
        WindowGroup {
            WeatherMainContentView()
                .environmentObject(appDelegate)
                .environmentObject(settingsStore)
                .onAppear {
                    appDelegate.settingsStore = settingsStore
                }
        }
    }
    
}
