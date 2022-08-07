//
//  WeatherForecastDayDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 01/08/2022.
//

import Foundation

struct WeatherForecastDayDataModel: Codable {
    let date: String?
    let date_epoch: Double?
    let day: CurrentDayWeatherDataModel?
    let astro: WeatherAstroDataModel?
    let hour: [WeatherHourlyDataModel]?
    
    var remainingWeatherHourlyDataModelList: [WeatherHourlyDataModel] {
        return hour?.filter { weatherHourlyDataModel in
            (weatherHourlyDataModel.time?.toDate() ?? Date()) > Date()
        } ?? []
    }

    private var currentWeatherHourlyDataModel: WeatherHourlyDataModel? {
        return hour?.first { hour in
            let calendar = Calendar.current

            let weatherHourlyDate = hour.time?.toDate(
                pattern: Constants.SERVER_DATE_TIME_FORMAT
            ) ?? Date()

            return calendar.component(.hour, from: Date()) == calendar.component(.hour, from: weatherHourlyDate)
        }
    }
    
    var currentWeatherDataModel: CurrentWeatherDataModel {
        return CurrentWeatherDataModel(
            last_updated_epoch: nil,
            last_updated: currentWeatherHourlyDataModel?.time,
            temp_c: currentWeatherHourlyDataModel?.temp_c,
            temp_f: currentWeatherHourlyDataModel?.temp_f,
            is_day: currentWeatherHourlyDataModel?.is_day,
            condition: currentWeatherHourlyDataModel?.condition,
            wind_mph: currentWeatherHourlyDataModel?.wind_mph,
            wind_kph: currentWeatherHourlyDataModel?.wind_kph,
            wind_degree: currentWeatherHourlyDataModel?.wind_degree,
            wind_dir: currentWeatherHourlyDataModel?.wind_dir,
            pressure_mb: currentWeatherHourlyDataModel?.pressure_mb,
            pressure_in: currentWeatherHourlyDataModel?.pressure_in,
            precip_mm: currentWeatherHourlyDataModel?.precip_mm,
            precip_in: currentWeatherHourlyDataModel?.precip_in,
            humidity: currentWeatherHourlyDataModel?.humidity,
            cloud: currentWeatherHourlyDataModel?.cloud,
            feelslike_c: currentWeatherHourlyDataModel?.feelslike_c,
            feelslike_f: currentWeatherHourlyDataModel?.feelslike_f,
            vis_km: currentWeatherHourlyDataModel?.vis_km,
            vis_miles: currentWeatherHourlyDataModel?.vis_miles,
            uv: currentWeatherHourlyDataModel?.uv,
            gust_mph: currentWeatherHourlyDataModel?.gust_mph,
            gust_kph: currentWeatherHourlyDataModel?.gust_kph,
            air_quality: nil
        )
    }
    
}
