//
//  ContentView.swift
//  Shared
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import SwiftUI
import MapItemPicker

struct WeatherMainContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    @StateObject private var locationModel = LocationModel()
    @StateObject private var settingsStore = SettingsStore()
    @State private var settingsState = false
    @State private var mapAddressPickerViewState = false
    
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
                    .sheet(isPresented: $settingsState, content: SettingsView.init)
                    Button(
                        action: requestLocation
                    ) {
                        Image(systemName: "location")
                    }
                    Button(
                        action: {
                            mapAddressPickerViewState.toggle()
                        }
                    ) {
                        Image(systemName: "pencil")
                    }
                    .mapItemPicker(isPresented: $mapAddressPickerViewState) { item in
                        print("Selected:\(item?.description)")
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
        .environmentObject(settingsStore)
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
