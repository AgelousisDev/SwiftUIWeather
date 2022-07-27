//
//  ContentView.swift
//  Shared
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import SwiftUI

struct WeatherMainContentView: View {
    
    @State private var selectedTab = WeatherNavigationScreen.Tomorrow.rawValue
    
    var body: some View {
            TabView(selection: $selectedTab) {
                TodayContentView()
                TomorrowContentView()
                NextDaysContentView()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainContentView()
    }
}
