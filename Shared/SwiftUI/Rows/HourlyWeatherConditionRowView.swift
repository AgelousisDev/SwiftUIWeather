//
//  HourlyConditionRowView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 06/08/2022.
//

import Foundation
import SwiftUI

struct HourlyWeatherConditionRowView: View {
    
    let weatherHourlyDataModel: WeatherHourlyDataModel
    
    var body: some View {
        VStack {
            
            // Current Hour Box
            ZStack {
                Text(weatherHourlyDataModel.displayTime ?? "")
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(.top, 8)
            }
            .frame(height: 30)
            
            Divider()
            
            // Main Content
            VStack(alignment: .center, spacing: 8) {
                
                AsyncImage(url: URL(string: weatherHourlyDataModel.condition?.iconUrl ?? ""))
                    .frame(width: 40, height: 40)
                
                Text(weatherHourlyDataModel.currentTemperatureUnitFormatted )
                    .font(.title2)
                
                Text(weatherHourlyDataModel.condition?.text ?? "")
                    .font(.subheadline)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.gray)
                
                Text(String(format: "key_feels_like_label".localized, weatherHourlyDataModel.feelsLikeTemperatureUnitFormatted ))
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(Color.gray)
                
                HStack(alignment: .center, spacing: 16) {
                    
                    Text(String(weatherHourlyDataModel.wind_kph?.toInt() ?? 0))
                        .font(.title2)
                        .foregroundColor(Color(weatherHourlyDataModel.windStateColor ?? UIColor.black))
                    
                    VStack(alignment: .center, spacing: 8) {
                        if weatherHourlyDataModel.wind_degree != nil, let arrowImage = CustomImage.arrowDirectionDown {
                            
                            Image(uiImage: arrowImage)
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color.gray)
                                .rotationEffect(Angle.degrees(Double(weatherHourlyDataModel.wind_degree ?? 0)))
                            
                            Text("key_km_hourly_label".localized)
                                .font(.subheadline)
                                .fontWeight(.light)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                .padding(.top, 8)
                
                Text(weatherHourlyDataModel.windStateWarning ?? "")
                    .font(.body)
                    .fontWeight(.light)
                    .foregroundColor(Color(weatherHourlyDataModel.windStateColor ?? UIColor.black))
                
                Text(String(format: "key_now_with_value_label".localized, weatherHourlyDataModel.windDirection))
                    .font(.callout)
                    .fontWeight(.ultraLight)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
                    .multilineTextAlignment(.center)
                
            }
            .frame(maxWidth: .infinity)
        }
        .frame(width: 130)
        .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(Color.accentColor, lineWidth: 1)
            )
    }
    
}

struct HourlyConditionRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        HourlyWeatherConditionRowView(weatherHourlyDataModel: WeatherHourlyDataModel(time_epoch: 12345, time: "2022-11-04 04:15", temp_c: 25, temp_f: 70, is_day: 1, condition: WeatherConditionDataModel(text: "Cloudy", icon: nil, code: nil), wind_mph: 30, wind_kph: 23, wind_degree: 90, wind_dir: "S", pressure_mb: 1, pressure_in: 2, precip_mm: 3, precip_in: 4, humidity: 5, cloud: 1, feelslike_c: 27, feelslike_f: 75, windchill_c: 8, windchill_f: 9, heatindex_c: 1, heatindex_f: 2, dewpoint_c: 3, dewpoint_f: 4, will_it_rain: 1, chance_of_rain: 1, will_it_snow: 0, chance_of_snow: 0, vis_km: 78, vis_miles: 90, gust_mph: 95, gust_kph: 100, uv: 8))
    }
}
