//
//  BindingUtils.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 26/08/2022.
//

import Foundation
import SwiftUI

extension Binding {
    func didSet(execute: @escaping (Value) -> Void) -> Binding {
        return Binding(
            get: { self.wrappedValue },
            set: {
                self.wrappedValue = $0
                execute($0)
            }
        )
    }
}
