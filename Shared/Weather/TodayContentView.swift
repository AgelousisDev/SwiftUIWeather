//
//  TodayContentView.swift
//  SwiftUIWeather (iOS)
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import Foundation
import SwiftUI

struct TodayContentView: View {
    var body: some View {
        Text(WeatherNavigationScreen.Today.label)
            .tabItem {
                Label(WeatherNavigationScreen.Today.label, systemImage: WeatherNavigationScreen.Today.icon)
            }
            .tag(WeatherNavigationScreen.Today.rawValue)
    }
}

struct TodayContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodayContentView()
    }
}
