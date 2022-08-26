//
//  NotificationHelper.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 26/08/2022.
//

import Foundation
import UserNotifications

class NotificationHelper {
    
    static let shared = NotificationHelper()
    
    func initializeNotificationAuthorization(with timeInterval: TimeInterval, notificationDataModel: NotificationDataModel) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                self.scheduleNotification(with: timeInterval, notificationdataModel: notificationDataModel)
            }
        }
    }
    
    func scheduleNotification(with timeInterval: TimeInterval, notificationdataModel: NotificationDataModel) {
        let content = UNMutableNotificationContent()
        content.title = notificationdataModel.title
        content.subtitle = notificationdataModel.body ?? ""
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: true)
        let request = UNNotificationRequest(identifier: notificationdataModel.notificationId, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func stopNotifications(with notificationId: String) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [notificationId])
    }
    
}
