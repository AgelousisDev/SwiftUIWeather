//
//  ObjectSaveable.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 20/08/2022.
//

import Foundation

protocol ObjectSaveable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}
