//
//  WeatherForecastDataModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation

struct WeatherForecastDataModel: Codable {
    let forecastday: [WeatherForecastDayDataModel]?
    
    
    var todayWeatherForecastDayDataModel: WeatherForecastDayDataModel? {
        return forecastday?.first { weatherForecastDayDataModel in
            Calendar.current.isDateInToday(weatherForecastDayDataModel.date?.toDate(
                pattern: Constants.SERVER_DATE_FORMAT
            ) ?? Date())
        }
    }

    var currentWeatherForecastDayDataModel: WeatherForecastDayDataModel? {
        return forecastday?.first
    }

    var nextWeatherForecastDayDataModel: WeatherForecastDayDataModel? {
        return forecastday?[1]
    }

    var nextWeatherForecastDayDataModelList: [WeatherForecastDayDataModel]? {
        var weatherForecastDayDataModelList = forecastday?.map { $0 }
        weatherForecastDayDataModelList?.removeFirst()
        return weatherForecastDayDataModelList
    }
    
}
