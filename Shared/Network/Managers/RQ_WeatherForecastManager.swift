//
//  RQ_WeatherForecastManager.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 28/07/2022.
//

import Foundation
import Alamofire

extension RequestManager {
    
    class func requestWeatherForecase(location: String, days: Int, airQualityState: Bool, alertsState: Bool, successModelBlock: @escaping SuccessModelBlock<WeatherResponseModel>, errorBlock: @escaping ErrorBlock) {
        let urlString = "\(ApiConstants.weatherBaseUrl)\(ApiConstants.Endpoints.forecastEndpoint)"
        let encoder = JSONEncoder()
        guard let url = URL(string: urlString) else {
            errorBlock(ErrorModel(localizedMessage: "key_generic_error_message".localized))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue(ApiConstants.NetworkValues.APPLICATION_JSON, forHTTPHeaderField: ApiConstants.headers.CONTENT_TYPE)
        let parameters: Parameters = [
            "key": ApiConstants.weatherApiKey,
            "q": location,
            "days": days.description,
            "aqi": airQualityState ? "yes" : "no",
            "alerts": alertsState ? "yes" : "no"
        ]
        AF.request(request, parameters: parameters).response(completionHandler: { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let weatherResponseModel = try decoder.decode(WeatherResponseModel.self, from: data)
                successModelBlock(weatherResponseModel)
            }
            catch let error {
                errorBlock(ErrorModel(localizedMessage: error.localizedDescription))
            }
        })
    }
    
}
