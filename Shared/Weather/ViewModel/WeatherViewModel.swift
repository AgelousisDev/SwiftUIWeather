//
//  WeatherMainContentView+Extensions.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation
import SwiftUI

    
class WeatherViewModel: ObservableObject {
        
    @Published var addressDataModel: AddressDataModel?
        
    @State var selectedTab = WeatherNavigationScreen.Today
        
    @State var isLoading = false
        
    @State var alertState = false
    @State var alertTuple: (String?, String?) = (nil, nil)
    
    @State var weatherResponseModel: WeatherResponseModel?
        
    func requestForecast(location: String, days: Int, airQualityState: Bool, alertsState: Bool, successModelBlock: @escaping SuccessModelBlock<WeatherResponseModel>) {
        isLoading = true
        RequestManager.requestWeatherForecase(location: location, days: days, airQualityState: airQualityState, alertsState: alertsState, successModelBlock: { weatherResponseModel in
            self.weatherResponseModel = weatherResponseModel
            successModelBlock(weatherResponseModel)
        }, errorBlock: { errorModel in
            self.alertState = true
            self.alertTuple = ("key_warning_label".localized, errorModel.localizedMessage)
        })
    }
    
}
    
