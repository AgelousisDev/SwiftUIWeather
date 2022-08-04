//
//  DoubleUtils.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 04/08/2022.
//

import Foundation

extension Double {
    func toInt() -> Int? {
        if self >= Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}
