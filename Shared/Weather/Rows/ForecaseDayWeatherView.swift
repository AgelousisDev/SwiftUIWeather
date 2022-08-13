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
    
    var body: some View {
        VStack {
            
        }
    }
    
}

struct ForecaseDayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ForecaseDayWeatherView(currentDayWeatherDataModel: CurrentDayWeatherDataModel(maxtemp_c: 30, maxtemp_f: 50, mintemp_c: 15, mintemp_f: 30, avgtemp_c: 40, avgtemp_f: 50, maxwind_mph: 50, maxwind_kph: 40, totalprecip_mm: 20, totalprecip_in: 10, avgvis_km: 5, avgvis_miles: 4, avghumidity: 20, daily_will_it_rain: 1, daily_chance_of_rain: 1, daily_will_it_snow: 0, daily_chance_of_snow: 0, condition: WeatherConditionDataModel(text: "Sunny", icon: "https://upload.wikimedia.org/wikipedia/commons/8/83/The_Sun_in_white_light.jpg", code: nil), uv: 8))
    }
}

