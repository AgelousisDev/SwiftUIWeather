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
        NavigationView {
            TabView(selection: $selectedTab) {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMainContentView()
    }
}
