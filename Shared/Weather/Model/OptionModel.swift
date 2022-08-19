//
//  OptionModel.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 19/08/2022.
//

import Foundation
import SwiftUI

struct OptionModel {
    let weatherSettings: WeatherSettings
    let label: String
    let optionList: [(String, Image)]?
    let selectedOptionIndex: Int? = nil
    let optionIsChecked = false
    let optionIsEnabled = true
}
