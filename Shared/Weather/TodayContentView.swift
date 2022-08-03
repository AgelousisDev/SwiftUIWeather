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
            if viewModel.weatherResponseModel != nil || isOnPreview {
            
                CalendarView()
            }
            ActivityIndicatorView(isAnimating: $viewModel.isLoading, style: .large)
        }
        .tabItem {
            Label(WeatherNavigationScreen.Today.label, systemImage: WeatherNavigationScreen.Today.icon)
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
