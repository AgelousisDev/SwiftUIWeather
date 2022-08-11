//
//  TomorrowContentView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import Foundation
import SwiftUI

struct TomorrowContentView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            if viewModel.weatherResponseModel != nil && !viewModel.isLoading || isOnPreview {
                
                ScrollView(.vertical) {
                    // Calendar Item
                    CalendarRowView()
                    
                    // Current Temperature
                    CurrentTemperatureRowView(currentWeatherDataModel: viewModel.weatherResponseModel?.forecast?.nextWeatherForecastDayDataModel?.currentWeatherDataModel)
                    
                    // Day Hourly Temperature
                    HeaderView(header: "key_temperature_label".localized)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HourlyWeatherConditionsRowView(weatherHourlyDataModelList: viewModel.weatherResponseModel?.forecast?.nextWeatherForecastDayDataModel?.remainingWeatherHourlyDataModelList ?? [], weatherNavigationScreen: WeatherNavigationScreen.Tomorrow)
                    
                    // Sun & Moon
                    HeaderView(header: "key_sun_and_moon_label".localized)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    SunAndMoonRowView(sunAndMoonStates: viewModel.weatherResponseModel?.forecast?.nextWeatherForecastDayDataModel?.astro?.availableSunAndMoonStates ?? [], weatherAstroDataModel: viewModel.weatherResponseModel?.forecast?.nextWeatherForecastDayDataModel?.astro)
                }
            }
            if viewModel.isLoading {
                ActivityIndicatorView(isAnimating: $viewModel.isLoading, style: .large)
            }
        }
        .tabItem {
               Label(WeatherNavigationScreen.Tomorrow.label, image: WeatherNavigationScreen.Tomorrow.icon)
        }
        .tag(WeatherNavigationScreen.Tomorrow.rawValue)
    }
}

struct TomorrowContentView_Previews: PreviewProvider {
    static var previews: some View {
        TomorrowContentView()
            .environmentObject(WeatherViewModel())
    }
}

