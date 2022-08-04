//
//  CurrentWeatherDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation
import UIKit

struct CurrentWeatherDataModel: Codable {
    var last_updated_epoch: Int? = nil
    var last_updated: String? = nil
    var temp_c: Double? = nil
    var temp_f: Double? = nil
    var is_day: Int? = nil
    var condition: WeatherConditionDataModel? = nil
    var wind_mph: Double? = nil
    var wind_kph: Double? = nil
    var wind_degree: Int? = nil
    var wind_dir: String? = nil
    var pressure_mb: Double? = nil
    var pressure_in: Double? = nil
    var precip_mm: Double? = nil
    var precip_in: Double? = nil
    var humidity: Int? = nil
    var cloud: Int? = nil
    var feelslike_c: Double? = nil
    var feelslike_f: Double? = nil
    var vis_km: Double? = nil
    var vis_miles: Double? = nil
    var uv: Double? = nil
    var gust_mph: Double? = nil
    var gust_kph: Double? = nil
    var air_quality: WeatherAirQualityDataModel? = nil
    
    var humidityDoubleValue: Double {
        if humidity ?? 0 > 0 {
            return Double(humidity ?? 0) / 100
        }
        else {
            return 0.0
        }
    }
    
    var currentTemperatureUnitFormatted: String {
        return String(format: "%d °C", Int(temp_c ?? 0))
    }

    var feelsLikeTemperatureUnitFormatted: String {
        return String(format: "%d °C", Int(feelslike_c ?? 0))
    }

    private var isDayBool: Bool {
        return is_day == 1
    }

    var dayStateAnimation: String {
        return isDayBool ? "day_animation" : "night_animation"
    }
    
    var windStateColor: UIColor? {
        switch Int(wind_kph ?? 0) {
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

    var windStateWarning: String? {
        let windSpeedWarningsArray = "key_wind_speed_warnings_array".localized.split(separator: "|")
        switch Int(wind_kph ?? 0) {
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

    var windDirection: String {
        let windDirectionsArray = "key_wind_directions_array".localized.split(separator: "|")
        var windDirections = [String]()
        for windDirection in Array(Set(wind_dir ?? ""))[0...1] {
            windDirections.append(
                windDirectionsArray.first {
                    $0.starts(
                        with: windDirection.description
                        //ignoreCase = true
                    )
                }?.description ?? ""
            )
        }
        return windDirections.joined(separator: "")
    }

    var uvIndexColor: UIColor? {
        switch Int(uv ?? 0.0) {
        case 0...2:
            return CustomColor.greenColor
        case 3...5:
            return CustomColor.yellowDarkerColor
        case 6...7:
            return CustomColor.orangeColor
        case 8...10:
            return CustomColor.redColor
        default:
            return CustomColor.violetColor
        }
    }
    
    var uvIndexExposureLevel: String {
        let uvIndexLevelsArray = "key_uv_index_levels_array".split(separator: "|")
        var index = 0
        switch Int(uv ?? 0) {
        case 0...2:
            index = 0
        case 3...5:
            index = 1
        case 6...7:
            index = 2
        case 8...10:
            index = 3
        default:
            index = 4
        }
        return uvIndexLevelsArray[index].description
    }
    
}
