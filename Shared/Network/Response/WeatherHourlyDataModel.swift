//
//  WeatherHourlyDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 01/08/2022.
//

import Foundation
import UIKit

struct WeatherHourlyDataModel: Codable, Identifiable {
    
    var id: String {
        return UUID().description
    }
    
    let time_epoch: CLong?
    let time: String?
    let temp_c: Double?
    let temp_f: Double?
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
    let windchill_c: Double?
    let windchill_f: Double?
    let heatindex_c: Double?
    let heatindex_f: Double?
    let dewpoint_c: Double?
    let dewpoint_f: Double?
    let will_it_rain: Int?
    let chance_of_rain: Int?
    let will_it_snow: Int?
    let chance_of_snow: Int?
    let vis_km: Double?
    let vis_miles: Double?
    let gust_mph: Double?
    let gust_kph: Double?
    let uv: Double?
    
    var currentTemperatureUnitFormatted: String {
        return String(format: "%d °C", Int(temp_c ?? 0))
    }
    
    var feelsLikeTemperatureUnitFormatted: String {
        return String(format: "%d °C", Int(feelslike_c ?? 0))
    }

    var displayTime: String? {
        return time?.toDate(
            pattern: Constants.SERVER_DATE_TIME_FORMAT
        )?.toDisplayDate(
            pattern: Constants.FULL_TIME_FORMAT
        )
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
    
}
