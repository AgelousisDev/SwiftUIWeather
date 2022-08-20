//
//  CenterModifier.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 20/08/2022.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
