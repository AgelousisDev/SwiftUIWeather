//
//  NextDaysContentView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import Foundation
import SwiftUI

struct NextDaysContentView: View {
    
    var viewModel: WeatherViewModel?
    
    var body: some View {
        Text(WeatherNavigationScreen.NextDays.label)
            .tabItem {
                Label(WeatherNavigationScreen.NextDays.label, systemImage: WeatherNavigationScreen.NextDays.icon)
            }
            .tag(WeatherNavigationScreen.NextDays.rawValue)
    }
}

struct NextDaysContentView_Previews: PreviewProvider {
    static var previews: some View {
        NextDaysContentView()
    }
}

