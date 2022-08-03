//
//  LocationModelProtocol.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 03/08/2022.
//

import Foundation

protocol LocationModelProtocol {
    func onLocationAddressReady(addressDataModel: AddressDataModel)
}
