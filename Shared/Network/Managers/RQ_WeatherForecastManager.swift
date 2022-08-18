//
//  RQ_WeatherForecastManager.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation
import Alamofire

extension RequestManager {
    
    class func requestWeatherForecast(location: String, days: Int, airQualityState: Bool, alertsState: Bool, successModelBlock: @escaping SuccessModelBlock<WeatherResponseModel>, errorBlock: @escaping ErrorBlock) {
        let urlString = "\(ApiConstants.weatherBaseUrl)\(ApiConstants.Endpoints.forecastEndpoint)"
        //let encoder = JSONEncoder()
        guard let _ = URL(string: urlString) else {
            errorBlock(ErrorModel(localizedMessage: "key_generic_error_message".localized))
            return
        }
        //let urlConvertible: Alamofire.URLConvertible = url

        //var urlRequest: Alamofire.URLRequestConvertible = URLRequest(url: url)
        //request.httpMethod = HTTPMethod.get.rawValue
       // request.setValue(ApiConstants.NetworkValues.APPLICATION_JSON, forHTTPHeaderField: ApiConstants.headers.CONTENT_TYPE)
        let parameters: Parameters = [
            ApiConstants.Parameters.WEATHER_API_KEY_PARAM: ApiConstants.weatherApiKey,
            ApiConstants.Parameters.LOCATION_PARAM: location,
            ApiConstants.Parameters.DAYS_PARAM: days.description,
            ApiConstants.Parameters.AIR_QUALITY_PARAM: airQualityState ? "yes" : "no",
            ApiConstants.Parameters.ALERTS_STATE_PARAM: alertsState ? "yes" : "no"
        ]
        AF.request(urlString, method: .get, parameters: parameters).responseDecodable(of: WeatherResponseModel.self) { response in
            if let weatherResponseModel = response.value,
               weatherResponseModel.current != nil,
               weatherResponseModel.location != nil,
               weatherResponseModel.forecast != nil {
                
                successModelBlock(weatherResponseModel)
            }
            else {
                
                errorBlock(ErrorModel(localizedMessage: response.error?.localizedDescription ?? "key_generic_error_message".localized))
            }
        }
    }
    
}
