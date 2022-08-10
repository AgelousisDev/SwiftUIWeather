//
//  DateUtils.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 02/08/2022.
//

import Foundation

extension Date {
    
    func toDisplayDate(pattern: String = Constants.DISPLAY_DATE_TIME_FORMAT, plusDays: Int = 0) -> String? {
        if plusDays > 0 {
            var dayComponent = DateComponents()
            dayComponent.day = plusDays
            let calendar = Calendar.current
            let date = calendar.date(byAdding: dayComponent, to: self)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = pattern
            if let date = date {
                return dateFormatter.string(from: date)
            }
            else {
                return nil
            }
        }
        else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = pattern
            return dateFormatter.string(from: self)
        }
    }
    
    var fullTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.FULL_TIME_FORMAT
        return dateFormatter.string(from: self)
    }
    
}
