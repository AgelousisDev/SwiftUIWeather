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
    @State private var settingsState = false
    
    var body: some View {
        NavigationView {
            TabView(selection: $viewModel.selectedTab) {
                TodayContentView()
                TomorrowContentView()
                NextDaysContentView()
            }
            .navigationBarTitle(viewModel.navigationBarTitle ?? "key_app_name_label".localized)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: HStack {
                    Button(
                        action: {
                            settingsState.toggle()
                        }
                    ) {
                        Image(systemName: "gearshape")
                    }
                    .sheet(isPresented: $settingsState) {
                        
                    }
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
        .alert(isPresented: $viewModel.alertState) {
            Alert(title: Text(viewModel.alertTuple.0 ?? ""), message: Text(viewModel.alertTuple.1 ?? ""), dismissButton: .cancel(Text("key_okLabel".localized)) {
                viewModel.dismissAlert()
            })
        }
        .environmentObject(viewModel)
        .environmentObject(locationModel)
        .onAppear {
            requestLocation()
        }
    }
    
    private func requestLocation() {
        viewModel.requestLocationState = true
        locationModel.locationModelProtocol = self
        locationModel.requestAuthorisation()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainContentView()
    }
}
