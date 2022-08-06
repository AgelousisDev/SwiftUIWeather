//
//  WeatherResponseModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation

struct WeatherResponseModel: Codable {
    let location: WeatherLocationDataModel?
    let current: CurrentWeatherDataModel?
    let forecast: WeatherForecastDataModel?
}
