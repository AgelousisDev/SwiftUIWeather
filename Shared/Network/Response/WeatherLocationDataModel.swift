//
//  WeatherLocationDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation

struct WeatherLocationDataModel: Codable {
        let name: String?
        let region: String?
        let country: String?
        let lat: Double?
        let lon: Double?
        let tz_id: String?
        let localtime_epoch: CLong?
        let localtime: String?

    var regionCountry: String {
        return String(format: "%@, %@", region ?? "",
                      country ?? "")
    }

}
