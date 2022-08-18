//
//  RequestLocationView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 18/08/2022.
//

import Foundation
import SwiftUI

struct RequestLocationView: View {
    
    var body: some View {
        ZStack(alignment: .center) {
            LottieView(filename: "location_animation", isPaused: false)
                .frame(width: 80, height: 80, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

struct RequestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RequestLocationView()
    }
}
