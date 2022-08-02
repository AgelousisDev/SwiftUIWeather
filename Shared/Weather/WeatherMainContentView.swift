//
//  ContentView.swift
//  Shared
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import SwiftUI

struct WeatherMainContentView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    init() {
        requestLocation()
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $viewModel.selectedTab.wrappedValue?.rawValue ?? WeatherNavigationScreen.Today.rawValue) {
                TodayContentView()
                TomorrowContentView()
                NextDaysContentView()
            }
            .navigationBarTitle("key_app_name_label".localized)
            .navigationBarItems(
                trailing: HStack {
                    Button(
                        action: {
                            
                        }
                    ) {
                        Image(systemName: "location")
                    }
                    Button(
                        action: {
                            
                        }
                    ) {
                        Image(systemName: "pencil")
                    }
                }
            )
        }
        .environmentObject(viewModel)
    }
}

func requestLocation() {
    LocationModel().requestAuthorisation()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainContentView()
    }
}
