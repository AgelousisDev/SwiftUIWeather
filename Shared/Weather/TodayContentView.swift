//
//  TodayContentView.swift
//  SwiftUIWeather (iOS)
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import Foundation
import SwiftUI

struct TodayContentView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            if viewModel.weatherResponseModel != nil && !viewModel.isLoading || isOnPreview {
                
                ScrollView(.vertical) {
                    // Calendar Item
                    CalendarRowView()
                    
                    // Current Temperature
                    CurrentTemperatureRowView(currentWeatherDataModel: viewModel.weatherResponseModel?.current)
                    
                    // Day Hourly Temperature
                    HeaderView(header: "key_temperature_label".localized)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HourlyWeatherConditionsRowView(weatherHourlyDataModelList: viewModel.weatherResponseModel?.forecast?.todayWeatherForecastDayDataModel?.remainingWeatherHourlyDataModelList ?? [], weatherNavigationScreen: WeatherNavigationScreen.Today)
                    
                    // Sun & Moon
                    HeaderView(header: "key_sun_and_moon_label".localized)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    SunAndMoonRowView(sunAndMoonStates: viewModel.weatherResponseModel?.forecast?.todayWeatherForecastDayDataModel?.astro?.availableSunAndMoonStates ?? [], weatherAstroDataModel: viewModel.weatherResponseModel?.forecast?.todayWeatherForecastDayDataModel?.astro)
                }
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
            Label(WeatherNavigationScreen.Today.label, image: WeatherNavigationScreen.Today.icon)
        }
        .tag(WeatherNavigationScreen.Today.rawValue)
    }
}

struct TodayContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodayContentView()
            .environmentObject(WeatherViewModel())
    }
}
