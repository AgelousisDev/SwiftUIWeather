//
//  Extensions.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 03/08/2022.
//

import Foundation

var isOnPreview: Bool {
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}
