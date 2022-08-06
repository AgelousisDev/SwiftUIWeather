//
//  WeatherNavigationScreen.swift
//  SwiftUIWeather (iOS)
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import Foundation


enum WeatherNavigationScreen: String {
        
    case Today
    case Tomorrow
    case NextDays
    
    var label: String {
        switch self {
        case .Today:
            return "key_today_label".localized
        case .Tomorrow:
            return "key_tomorrow_label".localized
        case .NextDays:
            return "key_next_days_label".localized
        }
    }
    
    
    var icon: String {
        switch self {
        case .Today:
            return "ic_today"
        case .Tomorrow:
            return "ic_tomorrow"
        case .NextDays:
            return "ic_next_days"
        }
    }
    
}
