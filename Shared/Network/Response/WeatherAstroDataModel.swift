//
//  WeatherAstroDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 01/08/2022.
//

import Foundation

struct WeatherAstroDataModel: Codable {
    let sunrise: String?
    let sunset: String?
    let moonrise: String?
    let moonset: String?
    let moon_phase: String?
    let moon_illumination: String?
    
    var availableSunAndMoonStates: [SunAndMoonState] {
        var sunAndMoonStates = [SunAndMoonState]()
        if sunrise != nil {
            sunAndMoonStates.append(.SUNRISE)
        }
        if moonrise != nil {
            sunAndMoonStates.append(.MOONRISE)
        }
        if sunset != nil {
            sunAndMoonStates.append(.SUNSET)
        }
        if moonset != nil {
            sunAndMoonStates.append(.MOON_SET)
        }
        return sunAndMoonStates
    }
    
}
