//
//  SettingsStore.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 19/08/2022.
//

import Foundation
import SwiftUI
import Combine

final class SettingsStore: ObservableObject {
    
    enum Keys {
        static let temperatureType = "temperatureType"
        static let offlineMode = "offlineMode"
        static let weatherNotifications = "weatherNotifications"
        static let weatherResponseModel = "weatherResponseModel"
        static let addressDataModel = "addressDataModel"
    }
    
    private let cancellable: Cancellable
    private let defaults: UserDefaults
    
    let objectWillChange = PassthroughSubject<Void, Never>()

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            Keys.temperatureType: TemperatureUnitType.CELCIUS.rawValue,
            Keys.offlineMode: false,
            Keys.weatherNotifications: false
        ])
        
        cancellable = NotificationCenter.default
            .publisher(for: UserDefaults.didChangeNotification)
            .map { _ in () }
            .subscribe(objectWillChange)
    }
    
    var temperatureUnitType: TemperatureUnitType {
        set { defaults.set(newValue.rawValue, forKey: Keys.temperatureType) }
        get { return defaults.string(forKey: Keys.temperatureType)
            .flatMap { TemperatureUnitType(rawValue: $0) } ?? .CELCIUS }
    }

    var offlineMode: Bool {
        set { defaults.set(newValue, forKey: Keys.offlineMode) }
        get { defaults.bool(forKey: Keys.offlineMode) }
    }

    var weatherNotificationsState: Bool {
        set {
            NotificationHelper.shared.initializeNotificationAuthorization(with: 60 * 60) { authorizationState in
                self.defaults.set(authorizationState, forKey: Keys.weatherNotifications)
            }
        }
        get { defaults.bool(forKey: Keys.weatherNotifications) }
    }
    
    var weatherResponseModel: WeatherResponseModel? {
        set { try? defaults.setObject(newValue, forKey: Keys.weatherResponseModel) }
        get { try? defaults.getObject(forKey: Keys.weatherResponseModel, castTo: WeatherResponseModel.self) }
    }
    
    var addressDataModel: AddressDataModel? {
        set { try? defaults.setObject(newValue, forKey: Keys.addressDataModel) }
        get { try? defaults.getObject(forKey: Keys.addressDataModel, castTo: AddressDataModel.self) }
    }
    
    
}
