//
//  WeatherHourlyDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 01/08/2022.
//

import Foundation
import UIKit

struct WeatherHourlyDataModel: Codable {
    var time_epoch: CLong? = nil
    var time: String? = nil
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
    var windchill_c: Double? = nil
    var windchill_f: Double? = nil
    var heatindex_c: Double? = nil
    var heatindex_f: Double? = nil
    var dewpoint_c: Double? = nil
    var dewpoint_f: Double? = nil
    var will_it_rain: Int? = nil
    var chance_of_rain: Int? = nil
    var will_it_snow: Int? = nil
    var chance_of_snow: Int? = nil
    var vis_km: Double? = nil
    var vis_miles: Double? = nil
    var gust_mph: Double? = nil
    var gust_kph: Double? = nil
    var uv: Double? = nil
    
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
    
}
