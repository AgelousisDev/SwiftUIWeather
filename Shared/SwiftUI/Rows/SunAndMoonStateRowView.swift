//
//  SunAndMonnStateRowView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 10/08/2022.
//

import Foundation
import SwiftUI

struct SunAndMoonStateRowView: View {
    
    let sunAndMoonState: SunAndMoonState
    let weatherAstroDataModel: WeatherAstroDataModel?
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
                
            sunAndMoonState.icon
                .resizable()
                .frame(width: 30, height: 30)
                .frame(maxWidth: 30, maxHeight: 30)
                .padding(.top, 20)
                
            Text(sunAndMoonState.label)
                .font(.subheadline)
                .fontWeight(.light)
                
            Divider()
                .padding(.horizontal, 6)
                
            ZStack(alignment: .center) {
                    
                Text(sunAndMoonStateTime)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 120, height: 120)
        .overlay(
                Circle()
                    .stroke(Color.accentColor, lineWidth: 1)
            )
    }
    
    var sunAndMoonStateTime: String {
        switch sunAndMoonState {
        case .SUNRISE:
            return weatherAstroDataModel?.sunrise?.toDate(
                pattern: Constants.SMALL_TIME_FORMAT
            )?.fullTime ?? ""
        case .MOONRISE:
            return weatherAstroDataModel?.moonrise?.toDate(
                pattern: Constants.SMALL_TIME_FORMAT
            )?.fullTime ?? ""
        case .SUNSET:
            return weatherAstroDataModel?.sunset?.toDate(
                pattern: Constants.SMALL_TIME_FORMAT
            )?.fullTime ?? ""
        case .MOON_SET:
            return weatherAstroDataModel?.moonset?.toDate(
                pattern: Constants.SMALL_TIME_FORMAT
            )?.fullTime ?? ""
        }
    }
    
}

struct SunAndMoonStateRowView_Previews: PreviewProvider {
    static var previews: some View {
        SunAndMoonStateRowView(sunAndMoonState: SunAndMoonState
            .SUNRISE,
            weatherAstroDataModel: WeatherAstroDataModel(sunrise: "07:00", sunset: "20:00", moonrise: "06:00", moonset: "19:00", moon_phase: "", moon_illumination: "10"
            )
        )
    }
}


