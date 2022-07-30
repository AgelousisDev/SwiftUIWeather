//
//  CurrentWeatherDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation

struct CurrentWeatherDataModel: Codable {
    let last_updated_epoch: Long? = nil
    let last_updated: String? = nil
    let temp_c: Double? = nil
    let temp_f: Double? = nil
    let is_day: Int? = nil
    let condition: WeatherConditionDataModel? = nil
    let wind_mph: Double? = nil
    let wind_kph: Double? = nil
    let wind_degree: Int? = nil
    let wind_dir: String? = nil
    let pressure_mb: Double? = nil
    let pressure_in: Double? = nil
    let precip_mm: Double? = nil
    let precip_in: Double? = nil
    let humidity: Int? = nil
    let cloud: Int? = nil
    let feelslike_c: Double? = nil
    let feelslike_f: Double? = nil
    let vis_km: Double? = nil
    let vis_miles: Double? = nil
    let uv: Double? = nil
    let gust_mph: Double? = nil
    let gust_kph: Double? = nil
    let air_quality: WeatherAirQualityDataModel? = nil
    
    
    var currentTemperatureUnitFormatted: String {
        return "%d °C".format(
            tempC?.toInt() ?? 0
        )
    }

    var feelsLikeTemperatureUnitFormatted: String {
        return "%d °C".format(
            feelsLikeC?.toInt() ?? 0
        )
    }

    private var isDayBool: Bool {
        return is_day == 1
    }

    var dayStateAnimationResourceId: Int {
        return isDayBool ? 0/*R.raw.day_animation*/ : 1//R.raw.night_animation
    }
    
    var windStateColor: UIColor {
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
        switch Int(windKph ?? 0) {
        case 0...19:
            return windSpeedWarningsArray.first?.description
        case 20...29:
            return windSpeedWarningsArray[1]?.description
        case 30...49:
            return windSpeedWarningsArray[2]?.description
        case 50...99:
            return windSpeedWarningsArray[3]?.description
        default:
            return windSpeedWarningsArray[4]?.description
        }
    }

    var getWindDirection: String {
        let windDirectionsArray = "key_wind_directions_array".localized.split(separator: "|")
        let windDirections = [String]()
        for windDirection in Array(Set(wind_dir ?? ""))[0...1] {
            windDirections.append(
                windDirectionsArray.first {
                    $0.starts(
                        with: windDirection.toString()
                        //ignoreCase = true
                    )
                }
            )
        }
        return windDirections.joined(separator: "")
    }

    var uvIndexColor: UIColor {
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
        return uvIndexLevelsArray[index]
    }
    
}
