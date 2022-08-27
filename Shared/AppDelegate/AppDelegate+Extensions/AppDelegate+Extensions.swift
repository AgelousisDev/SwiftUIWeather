//
//  AppDelegate+Extensions.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 27/08/2022.
//

import Foundation
import UserNotifications

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        print("Tapped in notification")
        removeWeatherNotificationAndScheduleNew()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Notification being triggered")
            //You can either present alert ,sound or increase badge while the app is in foreground too with ios 10
            //to distinguish between notifications
        if notification.request.identifier == SettingsStore.Keys.weatherNotifications {

            completionHandler([.banner, .list, .sound])
            removeWeatherNotificationAndScheduleNew()
        }
    }
    
    private func removeWeatherNotificationAndScheduleNew() {
        NotificationHelper.shared.stopNotifications(with: SettingsStore.Keys.weatherNotifications)
        if let settingsStore = settingsStore {
         
            NotificationHelper.shared.initializeNotificationAuthorization(with: 60, appDelegate: self, settingsStore: settingsStore) { _ in }
        }
    }
    
}
