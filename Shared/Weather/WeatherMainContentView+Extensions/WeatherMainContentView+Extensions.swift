//
//  WeatherMainContentView+Extensions.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation
import UIKit
import SwiftUI

extension WeatherMainContentView {
    
    @MainActor class WeatherViewModel: ObservableObject {
        
        @Published var addressDataModel: AddressDataModel?
        
        @State var selectedTab = WeatherNavigationScreen.Tomorrow.rawValue
        
        @State var isLoading = false
        
        @State var alertState = false
        @State var alertTuple: (String?, String?) = (null, null)
        
        func requestForecase(location: String, days: Int, airQualityState: Bool, alertsState: Bool, successModelBlock: @escaping SuccessModelBlock<WeatherResponseModel>) {
            isLoading = true
            RequestManager.requestWeatherForecase(location: location, days: days, airQualityState: airQualityState, alertsState: alertsState, successModelBlock: { weatherResponseModel in
                successModelBlock(weatherResponseModel)
            }, errorBlock: { errorModel in
                alertsState = true
                alertTuple = ("key_warning_label".localized, errorModel.localizedMessage)
            })
        }
        
    }
    
}
