//
//  WeatherConditionDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 29/07/2022.
//

import Foundation

struct WeatherConditionDataModel: Codable {
    let text: String?
    let icon: String?
    let code: Int?
    
    var iconUrl: String? {
        if icon?.contains("https:") == true {
            return icon
        }
        else {
            return String(format: "%@%@", icon ?? "")
        }
    }
    
}
