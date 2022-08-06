//
//  WeatherForecastDayDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 01/08/2022.
//

import Foundation

struct WeatherForecastDayDataModel: Codable {
    let date: String?
    let date_epoch: Double?
    let day: CurrentDayWeatherDataModel?
    let astro: WeatherAstroDataModel?
    let hour: [WeatherHourlyDataModel]?
}
