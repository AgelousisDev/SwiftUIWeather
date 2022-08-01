//
//  WeatherAirQualityDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 29/07/2022.
//

import Foundation

struct WeatherAirQualityDataModel: Codable {
    let co: Double?
    let no2: Double?
    let o3: Double?
    let so2: Double?
    let pm2_5: Double?
    let pm10: Double?
    let usEpaIndex: Double?
    let gbDefraIndex: Double?
    
    
    private enum CodingKeys: String, CodingKey {
            case co = "co"
            case no2 = "no2"
            case o3 = "o3"
            case so2 = "so2"
            case pm2_5 = "pm2_5"
            case pm10 = "pm10"
            case usEpaIndex = "us-epa-index"
            case gbDefraIndex = "gb-defra-index"
        }
    
}
