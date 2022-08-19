//
//  TemperatureUnitType.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 19/08/2022.
//

import Foundation
import SwiftUI

enum TemperatureUnitType: String, CaseIterable {
    case CELCIUS = "CELCIUS"
    case FAHRENHEIT = "FAHRENHEIT"
    
    var label: String? {
        switch self {
        case .CELCIUS:
            return "key_temperature_unit_types_array".localized.split(separator: "|").first?.description
        case .FAHRENHEIT:
            return "key_temperature_unit_types_array".localized.split(separator: "|")[1].description
        }
    }
    
    var icon: Image {
        switch self {
        case .CELCIUS:
            return CustomImage.celsiusTemperature
        case .FAHRENHEIT:
            return CustomImage.fahrenheitTemperature
        }
    }
    
}
