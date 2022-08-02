//
//  File.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 01/08/2022.
//

import Foundation
import UIKit

struct CurrentDayWeatherDataModel: Codable {
    let maxtemp_c: Double?
    let maxtemp_f: Double?
    let mintemp_c: Double?
    let mintemp_f: Double?
    let avgtemp_c: Double?
    let avgtemp_f: Double?
    let maxwind_mph: Double?
    let maxwind_kph: Double?
    let totalprecip_mm: Double?
    let totalprecip_in: Double?
    let avgvis_km: Double?
    let avgvis_miles: Double?
    let avghumidity: Double?
    let daily_will_it_rain: Double?
    let daily_chance_of_rain: Double?
    let daily_will_it_snow: Double?
    let daily_chance_of_snow: Double?
    let condition: WeatherConditionDataModel?
    let uv: Double
    
    var currentMinMaxTemperatureUnitFormatted: String {
        return String(format: "%d °C - %d °C", Int(mintemp_c ?? 0),
                      Int(maxtemp_c ?? 0))
    }

    var windStateWarning: String? {
        let windSpeedWarningsArray = "key_wind_speed_warnings_array".localized.split(separator: "|")
        switch Int(maxwind_kph ?? 0) {
        case 0...19:
            return windSpeedWarningsArray.first?.description
        case 20...29:
            return windSpeedWarningsArray[1].description
        case 30...49:
            return windSpeedWarningsArray[2].description
        case 50...99:
            return windSpeedWarningsArray[3].description
        default:
            return windSpeedWarningsArray[4].description
        }
    }

    var windStateColor: UIColor? {
        switch Int(maxwind_kph ?? 0) {
        case 0...19:
            return CustomColor.blueColor
        case 20...29:
            return CustomColor.tealColor
        case 30...49:
            return CustomColor.greenColor
        case 50...99:
            return CustomColor.yellowDarkerColor
        default:
            return CustomColor.redColor
        }
    }
    
}
