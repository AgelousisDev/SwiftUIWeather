//
//  CurrentWeatherDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation
import UIKit

struct CurrentWeatherDataModel: Codable {
    let last_updated_epoch: Int?
    let last_updated: String?
    let temp_c: Double?
    var temp_f: Double?
    let is_day: Int?
    let condition: WeatherConditionDataModel?
    let wind_mph: Double?
    let wind_kph: Double?
    let wind_degree: Int?
    let wind_dir: String?
    let pressure_mb: Double?
    let pressure_in: Double?
    let precip_mm: Double?
    let precip_in: Double?
    let humidity: Int?
    let cloud: Int?
    let feelslike_c: Double?
    let feelslike_f: Double?
    let vis_km: Double?
    let vis_miles: Double?
    let uv: Double?
    let gust_mph: Double?
    let gust_kph: Double?
    let air_quality: WeatherAirQualityDataModel?
    
    var humidityDoubleValue: Double {
        if humidity ?? 0 > 0 {
            return Double(humidity ?? 0) / 100
        }
        else {
            return 0.0
        }
    }
    
    func currentTemperatureUnitFormatted(settingsStore: SettingsStore) -> String {
        switch settingsStore.temperatureUnitType {
        case .FAHRENHEIT:
            return String(format: "%d °F", Int(temp_f ?? 0))
        default:
            return String(format: "%d °C", Int(temp_c ?? 0))
        }
    }
    
    func feelsLikeTemperatureUnitFormatted(settingsStore: SettingsStore) -> String {
        switch settingsStore.temperatureUnitType {
        case .FAHRENHEIT:
            return String(format: "%d °F", Int(feelslike_f ?? 0))
        default:
            return String(format: "%d °C", Int(feelslike_c ?? 0))
        }
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
        if (wind_dir?.count ?? 0) > 1 {
            
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
        }
        else {
            
            if let windDir = wind_dir {
                
                windDirections.append(
                    windDirectionsArray.first {
                        $0.starts(with: windDir)
                    }?.description ?? ""
                )
            }
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
        let uvIndexLevelsArray = "key_uv_index_levels_array".localized.split(separator: "|")
        var index = 0
        switch Int(uv ?? 0.0) {
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
