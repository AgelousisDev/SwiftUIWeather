//
//  ApiConstant.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation

struct ApiConstants {
    
    static let weatherBaseUrl = "https://api.weatherapi.com/v1/"
    static let weatherApiLogoUrl = "https://cdn.weatherapi.com/v4/images/weatherapi_logo.png"
    static let weatherApiKey = "3299b75bd83b4133b1e52728221706"
    
    struct Endpoints {
        static let forecastEndpoint = "forecast.json"
    }
    
    struct headers {
        static let CONTENT_TYPE = "Content-Type"
    }
    
    struct NetworkValues {
        static let APPLICATION_JSON = "application/json;charset=UTF-8"
    }
    
    struct Parameters {
        static let WEATHER_API_KEY_PARAM = "key"
        static let LOCATION_PARAM = "q"
        static let DAYS_PARAM = "days"
        static let AIR_QUALITY_PARAM = "aqi"
        static let ALERTS_STATE_PARAM = "alerts"
    }
    
}
