//
//  NextDaysContentView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import Foundation
import SwiftUI

struct NextDaysContentView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            List {
                if viewModel.weatherResponseModel != nil && !viewModel.isLoading && !viewModel.requestLocationState || isOnPreview {
                    
                    ForEach(0..<viewModel.nextDaysForecastDataList.count, id: \.self) { index in
                        
                        if let header = viewModel.nextDaysForecastDataList[index] as? String {
                            
                            HeaderView(header: header)
                                .listRowSeparator(.hidden)
                        }
                        
                        if let currentDayWeatherDataModel = viewModel.nextDaysForecastDataList[index] as? CurrentDayWeatherDataModel {
                            
                            ForecaseDayWeatherView(currentDayWeatherDataModel: currentDayWeatherDataModel)
                                .listRowSeparator(.hidden)
                        }
                        
                        if let weatherHourlyDataModelList = viewModel.nextDaysForecastDataList[index] as? [WeatherHourlyDataModel] {
                            
                            HourlyWeatherConditionsRowView(weatherHourlyDataModelList: weatherHourlyDataModelList, weatherNavigationScreen: WeatherNavigationScreen.NextDays)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
            }
            .refreshable {
                viewModel.weatherRefreshControl?.onRefresh()
            }
            if viewModel.isLoading {
                ActivityIndicatorView(isAnimating: $viewModel.isLoading, style: .large)
            }
            if (viewModel.requestLocationState) {
                RequestLocationView()
            }
            if (viewModel.networkErrorState) {
                NetworkErrorView()
            }
        }
        .tabItem {
            Label(WeatherNavigationScreen.NextDays.label, image: WeatherNavigationScreen.NextDays.icon)
        }
        .tag(WeatherNavigationScreen.NextDays.rawValue)
    }
}

struct NextDaysContentView_Previews: PreviewProvider {
    static var previews: some View {
        NextDaysContentView()
            .environmentObject(WeatherViewModel())
    }
}

