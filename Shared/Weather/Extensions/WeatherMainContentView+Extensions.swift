//
//  WeatherMainContentView+Extensions.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 03/08/2022.
//

import Foundation
import MapKit

extension WeatherMainContentView: LocationModelProtocol {
    func onLocationAddressReady(addressDataModel: AddressDataModel) {
        settingsStore.addressDataModel = addressDataModel
        viewModel.requestLocationState = false
        viewModel.navigationBarTitle = addressDataModel.addressLine
        requestWeatherForecast(with: addressDataModel)
    }
    
    func configureLocation(from mkMapItem: MKMapItem) {
        LocationModel.getAddressFromLatLon(pdblLatitude: mkMapItem.placemark.location?.coordinate.latitude ?? 0, withLongitude: mkMapItem.placemark.location?.coordinate.longitude ?? 0) { addressDataModel in
            locationModel.addressDataModel = addressDataModel
            self.onLocationAddressReady(addressDataModel: addressDataModel)
        }
    }
    
    func requestWeatherForecast(with addressDataModel: AddressDataModel?) {
        viewModel.requestForecast(settingsStore: settingsStore, location: String(format: "%f,%f", addressDataModel?.latitude ?? 0, addressDataModel?.longitude ?? 0), days: 7, airQualityState: true, alertsState: true
        )
    }
    
}

extension WeatherMainContentView: WeatherResfreshControl {
    func onRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            requestWeatherForecast(with: locationModel.addressDataModel)
        }
    }
}
