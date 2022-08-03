//
//  WeatherMainContentView+Extensions.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 03/08/2022.
//

import Foundation

extension WeatherMainContentView: LocationModelProtocol {
    func onLocationAddressReady(addressDataModel: AddressDataModel) {
        viewModel.requestForecast(location: String(format: "%f,%f", addressDataModel.latitude ?? 0, addressDataModel.longitude ?? 0), days: 7, airQualityState: true, alertsState: true
        )
    }
}
