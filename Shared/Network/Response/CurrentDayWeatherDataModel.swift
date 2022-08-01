//
//  File.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 01/08/2022.
//

import Foundation

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
}
