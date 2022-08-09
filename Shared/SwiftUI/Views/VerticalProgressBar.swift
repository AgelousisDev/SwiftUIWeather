//
//  VerticalProgressBar.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 06/08/2022.
//

import Foundation
import SwiftUI

struct VerticalProgressBar: View {
    
    let width: Float
    let height: Float
    let value: Float
    let color: Color
        
        var body: some View {
            ZStack(alignment: .bottom) {
                Rectangle().frame(width: CGFloat(width), height: CGFloat(height))
                    .opacity(0.3)
                    .foregroundColor(.gray)
                    
                Rectangle().frame(width: CGFloat(width), height: CGFloat(self.value) * CGFloat(height))
                    .foregroundColor(color)
                    .animation(.linear, value: 1)
            }
            .cornerRadius(45.0)
        }
}

struct VerticalProgressBar_Previews: PreviewProvider {
    
    static var previews: some View {
        VerticalProgressBar(width: 30, height: 500, value: 0.5, color: .accentColor)
    }
}

