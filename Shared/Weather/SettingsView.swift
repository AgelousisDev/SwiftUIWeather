//
//  SettingsView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 19/08/2022.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: SettingsStore
    
    var body: some View {
        Form {
            // Temperature Unit Type
            Section(header: Text("key_temperature_unit_label".localized)) {
                
                Picker(
                    selection: $settings.temperatureUnitType,
                    label: Text("")
                ) {
                    ForEach(TemperatureUnitType.allCases, id: \.self) {
                        Text($0.rawValue).tag($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            // Offline Mode
            Section(header: Text("key_network_label".localized)) {
                Toggle(isOn: $settings.offlineMode) {
                    Text("key_load_saved_weather_when_offline_label".localized)
                }
            }
            // Weather Notifications
            Section(header: Text("key_notifications".localized)) {
                Toggle(isOn: $settings.weatherNotificationsState) {
                    Text("key_weather_notifications_label".localized)
                }
            }
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(SettingsStore())
    }
}
