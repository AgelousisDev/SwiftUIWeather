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
    @StateObject var locationModel = LocationModel()
    @EnvironmentObject var settingsStore: SettingsStore
    @State private var settingsState = false
    @State private var mapAddressPickerViewState = false
    
    init() {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
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
                    .mapItemPicker(isPresented: $mapAddressPickerViewState) { mkMapItem in
                        if let mkMapItem = mkMapItem {
                            configureLocation(from: mkMapItem)
                        }
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
            viewModel.weatherRefreshControl = self
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
