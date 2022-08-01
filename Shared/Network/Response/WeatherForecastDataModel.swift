//
//  WeatherForecastDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation

struct WeatherForecastDataModel: Codable {
    let forecastday: [WeatherForecastDayDataModel]?
    
}
