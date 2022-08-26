//
//  AddressDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation

struct AddressDataModel: Codable {
    let countryName: String?
    let countryCode: String?
    let longitude: Double?
    let latitude: Double?
    let addressLine: String?
}
