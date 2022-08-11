//
//  CurrentTemperatureRowView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 03/08/2022.
//

import Foundation
import SwiftUI

struct CurrentTemperatureRowView: View {
    
    let currentWeatherDataModel: CurrentWeatherDataModel?
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            temperatureView
            DotView()
                .frame(width: 8, height: 8)
            windView
            DotView()
                .frame(width: 8, height: 8)
            uvIndexView
            DotView()
                .frame(width: 8, height: 8)
            humidityView
        }
    }
    
    private var temperatureView: some View {
        VStack(alignment: .center, spacing: 8) {
            HStack(alignment: .center, spacing: 24) {
                Text(currentWeatherDataModel?.currentTemperatureUnitFormatted ?? "")
                    .font(.title2)
                AsyncImage(url: URL(string: currentWeatherDataModel?.condition?.iconUrl ?? ""), content: { image in
                    image.resizable()
                }, placeholder: {
                    ProgressView()
                })
                .frame(width: 40, height: 40)
            }
            Text(currentWeatherDataModel?.condition?.text ?? "")
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(Color.gray)
            Text(String(format: "key_feels_like_label".localized, currentWeatherDataModel?.feelsLikeTemperatureUnitFormatted ?? ""))
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(Color.gray)
        }
    }
    
    private var windView: some View {
        HStack(alignment: .center, spacing: 16) {
            
            Text(String(currentWeatherDataModel?.wind_kph?.toInt() ?? 0))
                .font(.title2)
                .foregroundColor(Color(currentWeatherDataModel?.windStateColor ?? UIColor.black))
            
            VStack(alignment: .center, spacing: 8) {
                if currentWeatherDataModel?.wind_degree != nil {
                    
                    CustomImage.arrowDirectionDown
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color.gray)
                        .rotationEffect(Angle.degrees(Double(currentWeatherDataModel?.wind_degree ?? 0)))
                    
                    Text("key_km_hourly_label".localized)
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                }
            }
            
            VStack(alignment: .center, spacing: 8) {
                
                Text(currentWeatherDataModel?.windStateWarning ?? "")
                    .font(.body)
                    .fontWeight(.light)
                    .foregroundColor(Color(currentWeatherDataModel?.windStateColor ?? UIColor.black))
                
                Text(String(format: "key_now_with_value_label".localized, currentWeatherDataModel?.windDirection ?? ""))
                    .font(Font.callout)
                    .fontWeight(.ultraLight)
            }
            
            LottieView(filename: "wind_animation", isPaused: false)
                .frame(width: 50, height: 50)
        }
    }
    
    private var uvIndexView: some View {
        HStack(alignment: .center, spacing: 16) {
            
            VerticalProgressBar(width: 15, height: 100, value: Float(currentWeatherDataModel?.uv ?? 0.0) / 10, color: Color(currentWeatherDataModel?.uvIndexColor ?? .gray))
            
            VStack(alignment: .center, spacing: 8) {
                
                Text("key_uv_index_label".localized)
                    .font(.body)
                
                Text(String(format: "key_uv_index_value_label".localized, currentWeatherDataModel?.uvIndexExposureLevel ?? "", Int(currentWeatherDataModel?.uv ?? 0.0)))
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color(currentWeatherDataModel?.uvIndexColor ?? UIColor.black))
            }
            
            LottieView(filename: "sun_uv_animation", isPaused: false)
                .frame(width: 50, height: 50)
        }
    }
    
    private var humidityView: some View {
        HStack(alignment: .center, spacing: 32) {
            
            CircularProgressView(progress: (Double(currentWeatherDataModel?.humidityDoubleValue ?? 0.0)), color: Color(CustomColor.blueColor ?? .blue))
                .frame(width: 80, height: 80)
            
            VStack(alignment: .center, spacing: 8) {
                
                Text("key_humidity_label".localized)
                    .font(.body)
                
                Text(String(format: "key_value_with_percent_label".localized, currentWeatherDataModel?.humidity ?? 0))
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue.opacity(0.8))
            }
            
            LottieView(filename: "humidity_animation", isPaused: false)
                .frame(width: 50, height: 50)
        }
    }
    
}

struct CurrentTemperatureRowView_Previews: PreviewProvider {
    
    private static func getCurrentWeatherDataModel() -> CurrentWeatherDataModel {
        return CurrentWeatherDataModel(last_updated_epoch: 0, last_updated: nil, temp_c: 50, temp_f: 90, is_day: 1, condition: WeatherConditionDataModel(text: "Sunny", icon: "https://upload.wikimedia.org/wikipedia/commons/8/83/The_Sun_in_white_light.jpg", code: nil), wind_mph: 20.0, wind_kph: 20.0, wind_degree: 180, wind_dir: "SW", pressure_mb: 1.0, pressure_in: 2.0, precip_mm: 3.0, precip_in: 4.0, humidity: 50, cloud: 1, feelslike_c: 25.0, feelslike_f: 40.0, vis_km: 12.0, vis_miles: 18.0, uv: 8.0, gust_mph: 1.0, gust_kph: 0.5, air_quality: nil
        )
    }
    
    static var previews: some View {
        CurrentTemperatureRowView(currentWeatherDataModel: getCurrentWeatherDataModel())
    }
}

