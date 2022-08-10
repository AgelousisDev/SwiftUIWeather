//
//  HourlyWeatherConditionsRowView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 09/08/2022.
//

import Foundation
import SwiftUI

struct HourlyWeatherConditionsRowView: View {
    
    let weatherHourlyDataModelList: [WeatherHourlyDataModel]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 16) {
                ForEach(weatherHourlyDataModelList) { weatherHourlyDataModel in
                     
                    HourlyWeatherConditionRowView(weatherHourlyDataModel: weatherHourlyDataModel)
                    }
            }
            .padding(.all, 16)
        }
    }
    
}

struct HourlyWeatherConditionsRowView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherConditionsRowView(weatherHourlyDataModelList: [])
    }
}
