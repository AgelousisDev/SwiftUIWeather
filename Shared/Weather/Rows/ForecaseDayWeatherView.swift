//
//  ForecaseDayWeatherView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 13/08/2022.
//

import Foundation
import SwiftUI

struct ForecaseDayWeatherView: View {
    
    let currentDayWeatherDataModel: CurrentDayWeatherDataModel
    @EnvironmentObject private var settingsStore: SettingsStore
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 16) {
                // C
                Text(currentDayWeatherDataModel.currentMinMaxTemperatureUnitFormatted(settingsStore: settingsStore))
                    .font(.title2)
                // Condition Icon
                AsyncImage(url: URL(string: currentDayWeatherDataModel.condition?.iconUrl ?? ""), content: { image in
                    image.resizable()
                }, placeholder: {
                    ProgressView()
                })
                .frame(width: 40, height: 40)
            }
            // Condition Text
            Text(currentDayWeatherDataModel.condition?.text ?? "")
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(Color.gray)
            
            // Wind HStack
            HStack(alignment: .center, spacing: 16) {
                Text(String(currentDayWeatherDataModel.maxwind_kph?.toInt() ?? 0))
                    .font(.title2)
                    .foregroundColor(Color(currentDayWeatherDataModel.windStateColor ?? UIColor.black))
                Text(currentDayWeatherDataModel.windStateWarning ?? "")
                    .font(.body)
                    .fontWeight(.light)
                    .foregroundColor(Color(currentDayWeatherDataModel.windStateColor ?? UIColor.black))
                LottieView(filename: "wind_animation", isPaused: false)
                    .frame(width: 50, height: 50)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
}

struct ForecaseDayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ForecaseDayWeatherView(currentDayWeatherDataModel: CurrentDayWeatherDataModel(maxtemp_c: 30, maxtemp_f: 50, mintemp_c: 15, mintemp_f: 30, avgtemp_c: 40, avgtemp_f: 50, maxwind_mph: 50, maxwind_kph: 40, totalprecip_mm: 20, totalprecip_in: 10, avgvis_km: 5, avgvis_miles: 4, avghumidity: 20, daily_will_it_rain: 1, daily_chance_of_rain: 1, daily_will_it_snow: 0, daily_chance_of_snow: 0, condition: WeatherConditionDataModel(text: "Sunny", icon: "https://upload.wikimedia.org/wikipedia/commons/8/83/The_Sun_in_white_light.jpg", code: nil), uv: 8))
    }
}

