//
//  StringUtils.swift
//  SwiftUIWeather (iOS)
//
//  Created by Vagelis Agelousis on 27/07/2022.
//

import Foundation
import UIKit

extension String {
    
    var localized: String {
            return NSLocalizedString(self, comment: "")
    }
    
    func toColor(defaultColor: UIColor? = nil) -> UIColor? {
            
            var colorHexString: String = trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
            
            if (colorHexString.hasPrefix("#")) {
                
                colorHexString.remove(at: colorHexString.startIndex)
            }
            
            var rgbValue: UInt64 = 0
            Scanner(string: colorHexString).scanHexInt64(&rgbValue)
            
            let a, r, g, b: UInt64
            
            switch colorHexString.count {
            case 3:
                (a, r, g, b) = (255, (rgbValue >> 8) * 17, (rgbValue >> 4 & 0xF) * 17, (rgbValue & 0xF) * 17)
                
            case 6:
                (a, r, g, b) = (255, rgbValue >> 16, rgbValue >> 8 & 0xFF, rgbValue & 0xFF)
                
            case 8:
                (a, r, g, b) = (rgbValue >> 24, rgbValue >> 16 & 0xFF, rgbValue >> 8 & 0xFF, rgbValue & 0xFF)
                
            default:
                return defaultColor
            }
            
            return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        }
    
    func toDate(
        pattern: String = Constants.SERVER_DATE_TIME_FORMAT
    )-> Date? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterGet.dateFormat = pattern
        return dateFormatterGet.date(from: self)
    }
    
}
