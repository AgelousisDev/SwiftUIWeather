//
//  SunAndMoonRowView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 10/08/2022.
//

import Foundation
import SwiftUI

struct SunAndMoonRowView: View {
    
    let sunAndMoonStates: [SunAndMoonState]
    let weatherAstroDataModel: WeatherAstroDataModel?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 16) {
                ForEach(sunAndMoonStates) { sunAndMoonstate in
                    
                    SunAndMoonStateRowView(sunAndMoonState: sunAndMoonstate, weatherAstroDataModel: weatherAstroDataModel)
                }
            }
            .padding(.all, 16)
        }
    }
    
}

struct SunAndMoonRowView_Previews: PreviewProvider {
    static var previews: some View {
        SunAndMoonRowView(sunAndMoonStates: SunAndMoonState.allCases,
            weatherAstroDataModel: WeatherAstroDataModel(sunrise: "07:00", sunset: "20:00", moonrise: "06:00", moonset: "19:00", moon_phase: "", moon_illumination: "10"
            )
        )
    }
}
