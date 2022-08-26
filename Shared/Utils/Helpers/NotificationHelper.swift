//
//  NotificationHelper.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 26/08/2022.
//

import Foundation
import UserNotifications
import UIKit

typealias NotificationAuthorizationCompletionBlock = (Bool) -> Void

class NotificationHelper {
    
    static let shared = NotificationHelper()
    
    func initializeNotificationAuthorization(with timeInterval: TimeInterval, repeats: Bool = true, notificationAuthorizationCompletionBlock: @escaping NotificationAuthorizationCompletionBlock) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            notificationAuthorizationCompletionBlock(success)
            if success {
                self.requestNotificationdata(with: timeInterval, repeats: repeats)
            }
        }
    }

    private func requestNotificationdata(with timeInterval: TimeInterval, repeats: Bool) {
        let settingsStore = SettingsStore()
        if let addressDataModel = settingsStore.addressDataModel, let weatherResponseModel = settingsStore.weatherResponseModel {
         
            if let currentWeatherDataModel = weatherResponseModel.forecast?.todayWeatherForecastDayDataModel?.currentWeatherDataModel {
             
                openScopeAndScheduleNotification(
                    addressDataModel: addressDataModel,
                    currentWeatherDataModel: currentWeatherDataModel,
                    timeInterval: timeInterval,
                    repeats: repeats
                )
            }
        }
    }
    
    private func openScopeAndScheduleNotification(addressDataModel: AddressDataModel, currentWeatherDataModel: CurrentWeatherDataModel, timeInterval: TimeInterval, repeats: Bool) {
        let settingsStore = SettingsStore()
        let notificationDataModel = NotificationDataModel(notificationId: SettingsStore.Keys.weatherNotifications, title: addressDataModel.addressLine ?? "", body: String(format: "%s\n%s\n%s\n%s\n%s", currentWeatherDataModel.currentTemperatureUnitFormatted(settingsStore: settingsStore), currentWeatherDataModel.condition?.text ?? "", String(format: "%s %s", Int(currentWeatherDataModel.wind_kph ?? 0).description, "key_km_hourly_label".localized), currentWeatherDataModel.windStateWarning ?? "", String(format: "key_now_with_value_label".localized, currentWeatherDataModel.windDirection)), icon: currentWeatherDataModel.condition?.iconUrl ?? "")
        
        let content = UNMutableNotificationContent()
        content.title = notificationDataModel.title
        content.subtitle = notificationDataModel.body ?? ""
        content.sound = UNNotificationSound.default
        
        if let iconUrl = URL.init(string: notificationDataModel.icon ?? "") {
            if let attachment = try? UNNotificationAttachment.init(identifier: SettingsStore.Keys.weatherNotifications, url: iconUrl, options: nil) {
                
                content.attachments = [attachment]
            }
        }
            
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)
        let request = UNNotificationRequest(identifier: notificationDataModel.notificationId, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    
    func stopNotifications(with notificationId: String) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [notificationId])
    }
    
}
