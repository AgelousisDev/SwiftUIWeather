//
//  WeatherHourlyDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 01/08/2022.
//

import Foundation

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
}
