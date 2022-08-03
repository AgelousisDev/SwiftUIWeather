//
//  CurrentTemperatureRowView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 03/08/2022.
//

import Foundation
import SwiftUI

struct CurrentTemperatureRowView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            temperatureView
            
            
        }
    }
    
    private var temperatureView: some View {
        VStack(alignment: .center, spacing: 8) {
            HStack(alignment: .center, spacing: 16) {
                Text(viewModel.weatherResponseModel?.current?.currentTemperatureUnitFormatted ?? "")
                    .font(.title2)
                AsyncImage(url: URL(string: viewModel.weatherResponseModel?.current?.condition?.iconUrl ?? ""))
                    .frame(width: 40, height: 40)
            }
            Text(viewModel.weatherResponseModel?.current?.condition?.text ?? "")
                .font(.body)
                .foregroundColor(Color.gray)
            Text(String(format: "key_feels_like_label".localized, viewModel.weatherResponseModel?.current?.feelsLikeTemperatureUnitFormatted ?? ""))
                .font(.body)
                .foregroundColor(Color.gray)
        }
    }
    
}

struct CurrentTemperatureRowView_Previews: PreviewProvider {
    
    private static func getWeatherViewModel() -> WeatherViewModel {
        let weatherViewModel = WeatherViewModel()
        weatherViewModel.weatherResponseModel = WeatherResponseModel(location: nil, current: CurrentWeatherDataModel(last_updated_epoch: 0, last_updated: nil, temp_c: 50, temp_f: 90, is_day: 1, condition: WeatherConditionDataModel(text: "Sunny", icon: "https://upload.wikimedia.org/wikipedia/commons/8/83/The_Sun_in_white_light.jpg", code: nil), wind_mph: 20.0, wind_kph: 20.0, wind_degree: 90, wind_dir: "SW", pressure_mb: 1.0, pressure_in: 2.0, precip_mm: 3.0, precip_in: 4.0, humidity: 70, cloud: 1, feelslike_c: 25.0, feelslike_f: 40.0, vis_km: 12.0, vis_miles: 18.0, uv: 9, gust_mph: 1.0, gust_kph: 0.5, air_quality: nil))
        return weatherViewModel
    }
    
    static var previews: some View {
        CurrentTemperatureRowView()
            .environmentObject(CurrentTemperatureRowView_Previews.getWeatherViewModel())
    }
}

