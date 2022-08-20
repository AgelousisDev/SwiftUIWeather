//
//  ObjectSaveableError.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 20/08/2022.
//

import Foundation

enum ObjectSaveableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}
