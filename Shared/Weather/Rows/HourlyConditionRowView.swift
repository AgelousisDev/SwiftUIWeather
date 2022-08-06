//
//  HourlyConditionRowView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 06/08/2022.
//

import Foundation
import SwiftUI

struct HourlyConditionRowView: View {
    
    let weatherHourlyDataModel: WeatherHourlyDataModel
    
    var body: some View {
        VStack {
            
            // Current Hour Box
            ZStack {
                Text(weatherHourlyDataModel.displayTime ?? "")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .foregroundColor(.white)
            .frame(height: 30)
            
            // Main Content
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: weatherHourlyDataModel.condition?.iconUrl ?? ""))
                    .frame(width: 40, height: 40)
            }
            .padding(.leading, 16)
            .padding(.bottom, 16)
            .padding(.trailing, 16)
            .background(Color.accentColor)
            .opacity(0.1)
        }
        .frame(width: 130)
        .cornerRadius(8)
    }
    
}

struct HourlyConditionRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        HourlyConditionRowView(weatherHourlyDataModel: WeatherHourlyDataModel(time_epoch: 12345, time: "2022-11-04 04:15", temp_c: 25, temp_f: 70, is_day: 1, condition: WeatherConditionDataModel(text: "Cloudy", icon: nil, code: nil), wind_mph: 30, wind_kph: 23, wind_degree: 90, wind_dir: "S", pressure_mb: 1, pressure_in: 2, precip_mm: 3, precip_in: 4, humidity: 5, cloud: 1, feelslike_c: 27, feelslike_f: 75, windchill_c: 8, windchill_f: 9, heatindex_c: 1, heatindex_f: 2, dewpoint_c: 3, dewpoint_f: 4, will_it_rain: 1, chance_of_rain: 1, will_it_snow: 0, chance_of_snow: 0, vis_km: 78, vis_miles: 90, gust_mph: 95, gust_kph: 100, uv: 8))
    }
}
