//
//  NotificationHelper.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 26/08/2022.
//

import Foundation
import UserNotifications
import UIKit
import SwiftUI

typealias NotificationAuthorizationCompletionBlock = (Bool) -> Void

class NotificationHelper {
    
    static let shared = NotificationHelper()
    
    func initializeNotificationAuthorization(with timeInterval: TimeInterval, appDelegate: AppDelegate, repeats: Bool = true, settingsStore: SettingsStore, notificationAuthorizationCompletionBlock: @escaping NotificationAuthorizationCompletionBlock) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            notificationAuthorizationCompletionBlock(success)
            if success {
                self.requestNotificationdata(with: timeInterval, appDelegate: appDelegate, repeats: repeats, settingsStore: settingsStore)
            }
        }
    }

    private func requestNotificationdata(with timeInterval: TimeInterval, appDelegate: AppDelegate, repeats: Bool, settingsStore: SettingsStore) {
        if let addressDataModel = settingsStore.addressDataModel, let weatherResponseModel = settingsStore.weatherResponseModel {
         
            if let currentWeatherDataModel = weatherResponseModel.forecast?.todayWeatherForecastDayDataModel?.currentWeatherDataModel {
             
                scheduleNotification(
                    appDelegate: appDelegate,
                    addressDataModel: addressDataModel,
                    currentWeatherDataModel: currentWeatherDataModel,
                    timeInterval: timeInterval,
                    repeats: repeats,
                    settingsStore: settingsStore
                )
            }
        }
    }
    
    private func scheduleNotification(appDelegate: AppDelegate, addressDataModel: AddressDataModel, currentWeatherDataModel: CurrentWeatherDataModel, timeInterval: TimeInterval, repeats: Bool, settingsStore: SettingsStore) {
        let notificationDataModel = NotificationDataModel(notificationId: SettingsStore.Keys.weatherNotifications, title: addressDataModel.addressLine ?? "", body: String(format: "%@\n%@\n%@\n%@\n%@", currentWeatherDataModel.currentTemperatureUnitFormatted(settingsStore: settingsStore), currentWeatherDataModel.condition?.text ?? "", String(format: "%@ %@", Int(currentWeatherDataModel.wind_kph ?? 0).description, "key_km_hourly_label".localized), currentWeatherDataModel.windStateWarning ?? "", String(format: "key_now_with_value_label".localized, currentWeatherDataModel.windDirection)), icon: currentWeatherDataModel.condition?.iconUrl ?? "")
        
        let content = UNMutableNotificationContent()
        content.title = notificationDataModel.title
        content.subtitle = notificationDataModel.body ?? ""
        content.sound = UNNotificationSound.default
        
        if let icon = notificationDataModel.icon,
           let iconUrl = URL(string: icon) {
            
            iconUrl.downloadImage { uiImage in
                let attachment = UNNotificationAttachment.create(identifier: SettingsStore.Keys.weatherNotifications, image: uiImage, options: nil)
                guard let attachment = attachment else {
                    return
                }
                content.attachments = [attachment]
                self.triggerNotification(appDelegate: appDelegate, content: content, notificationDataModel: notificationDataModel, timeInterval: timeInterval, repeats: repeats)
            }
        }
        else {
            
            triggerNotification(appDelegate: appDelegate, content: content, notificationDataModel: notificationDataModel, timeInterval: timeInterval, repeats: repeats)
        }
    }
    
    private func triggerNotification(appDelegate: AppDelegate, content: UNMutableNotificationContent, notificationDataModel: NotificationDataModel, timeInterval: TimeInterval, repeats: Bool) {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)
        let request = UNNotificationRequest(identifier: notificationDataModel.notificationId, content: content, trigger: trigger)
        UNUserNotificationCenter.current().delegate = appDelegate
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {(_ error: Error?) -> Void in
            if error == nil {
                print("add NotificationRequest succeeded!")
            }
        })
    }
    
    
    func stopNotifications(with notificationId: String) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [notificationId])
    }
    
}
