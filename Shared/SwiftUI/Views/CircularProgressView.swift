//
//  CircularProgressView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 04/08/2022.
//

import Foundation
import SwiftUI

struct CircularProgressView: View {
    
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5.0)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.accentColor)
                .rotationEffect(Angle.degrees(270))
        }
    }
    
}

struct CircularProgressView_Previews: PreviewProvider {
    
    static var previews: some View {
        CircularProgressView(progress: 0.7)
            .frame(width: 200, height: 200)
    }
}
