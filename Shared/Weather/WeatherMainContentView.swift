//
//  ContentView.swift
//  Shared
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import SwiftUI

struct WeatherMainContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    @StateObject private var locationModel = LocationModel()
    
    var body: some View {
        NavigationView {
            TabView(selection: $viewModel.selectedTab) {
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
        .environmentObject(locationModel)
        .onAppear {
            requestLocation()
        }
    }
    
    private func requestLocation() {
        locationModel.locationModelProtocol = self
        locationModel.requestAuthorisation()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainContentView()
    }
}
