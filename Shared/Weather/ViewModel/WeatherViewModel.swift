//
//  WeatherMainContentView+Extensions.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation
import SwiftUI

    
class WeatherViewModel: ObservableObject {
                
    @Published var selectedTab = WeatherNavigationScreen.Today.rawValue
        
    @Published var isLoading = false
        
    @Published var alertState = false
    @Published var alertTuple: (String?, String?) = (nil, nil)
    
    @Published var weatherResponseModel: WeatherResponseModel?
        
    func requestForecast(location: String, days: Int, airQualityState: Bool, alertsState: Bool) {
        isLoading = true
        RequestManager.requestWeatherForecase(location: location, days: days, airQualityState: airQualityState, alertsState: alertsState, successModelBlock: { weatherResponseModel in
            self.weatherResponseModel = weatherResponseModel
        }, errorBlock: { errorModel in
            self.alertState = true
            self.alertTuple = ("key_warning_label".localized, errorModel.localizedMessage)
        })
    }
    
}
    
