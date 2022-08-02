//
//  TomorrowContentView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import Foundation
import SwiftUI

struct TomorrowContentView: View {
    
    var viewModel: WeatherViewModel?
    
    var body: some View {
        Text(WeatherNavigationScreen.Tomorrow.label)
            .tabItem {
                Label(WeatherNavigationScreen.Tomorrow.label, systemImage: WeatherNavigationScreen.Tomorrow.icon)
            }
            .tag(WeatherNavigationScreen.Tomorrow.rawValue)
    }
}

struct TomorrowContentView_Previews: PreviewProvider {
    static var previews: some View {
        TomorrowContentView()
    }
}

