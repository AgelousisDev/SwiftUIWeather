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
    @Published var navigationBarTitle: String?
        
    @Published var isLoading = false
    @Published var requestLocationState = false
        
    @Published var alertState = false
    @Published var alertTuple: (String?, String?) = (nil, nil)
    
    @Published var networkErrorState = false
    
    @Published var weatherResponseModel: WeatherResponseModel?
    
    var nextDaysForecastDataList: [Any] {
        var items = [Any]()
        for weatherForecastDayDataModel in weatherResponseModel?.forecast?.nextWeatherForecastDayDataModelList ?? [] {
            
            if (weatherForecastDayDataModel.hour == nil) {
                continue
            }
            
            items.append(
                weatherForecastDayDataModel.date?.toDate(
                    pattern: Constants.SERVER_DATE_FORMAT
                )?.toDisplayDate(
                    pattern: Constants.DISPLAY_DATE_FORMAT
                ) ?? ""
            )
            
            if let currentDayWeatherDataModel = weatherForecastDayDataModel.day {
                items.append(
                    currentDayWeatherDataModel
                )
            }
            
            if let weatherHourlyDataModelList = weatherForecastDayDataModel.hour {
                items.append(
                    weatherHourlyDataModelList
                )
            }
            
        }
        
        return items
    }
        
    func requestForecast(location: String, days: Int, airQualityState: Bool, alertsState: Bool) {
        isLoading = true
        RequestManager.requestWeatherForecast(location: location, days: days, airQualityState: airQualityState, alertsState: alertsState, successModelBlock: { weatherResponseModel in
            self.isLoading = false
            self.networkErrorState = false
            self.weatherResponseModel = weatherResponseModel
            if self.navigationBarTitle == nil {
                self.navigationBarTitle = weatherResponseModel.location?.regionCountry
            }
        }, errorBlock: { errorModel in
            self.isLoading = false
            self.networkErrorState = true
            self.showAlert()
            self.alertTuple = ("key_warning_label".localized, errorModel.localizedMessage)
        })
    }
    
    func showAlert() {
        alertState = true
    }
    
    func dismissAlert() {
        alertState = false
    }
    
}
    
