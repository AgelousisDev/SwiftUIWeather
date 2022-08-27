//
//  AppDelegate.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 27/08/2022.
//

import Foundation
import UIKit
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    var settingsStore: SettingsStore?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
}
