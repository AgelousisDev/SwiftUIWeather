//
//  TodayContentView.swift
//  SwiftUIWeather (iOS)
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import Foundation
import SwiftUI

struct TodayContentView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            if viewModel.weatherResponseModel != nil && !viewModel.isLoading || isOnPreview {
                
                CalendarRowView()
                CurrentTemperatureRowView()
            }
            if viewModel.isLoading {
                Spacer()
            }
            ActivityIndicatorView(isAnimating: $viewModel.isLoading, style: .large)
            if viewModel.isLoading {
                Spacer()
            }
        }
        .tabItem {
            Label(WeatherNavigationScreen.Today.label, image: WeatherNavigationScreen.Today.icon)
        }
        .tag(WeatherNavigationScreen.Today.rawValue)
    }
}

struct TodayContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodayContentView()
            .environmentObject(WeatherViewModel())
    }
}
