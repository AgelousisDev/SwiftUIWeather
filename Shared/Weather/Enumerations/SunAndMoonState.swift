//
//  SunAndMoonState.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 02/08/2022.
//

import Foundation
import UIKit

enum SunAndMoonState {
    case SUNRISE
    case MOONRISE
    case SUNSET
    case MOON_SET
    
    var icon: UIImage? {
        switch self {
        case .SUNRISE:
            return CustomImage.sunrise
        case . MOONRISE:
            return CustomImage.moonrise
        case .SUNSET:
            return CustomImage.sunset
        case .MOON_SET:
            return CustomImage.moonset
        }
    }
    
    var label: String {
        switch self {
        case .SUNRISE:
            return "key_sunrise_label".localized
        case .MOONRISE:
            return "key_moonrise_label".localized
        case .SUNSET:
            return "key_sunset_label".localized
        case .MOON_SET:
            return "key_moon_set_label".localized
        }
    }
    
}
