//
//  NetworkErrorView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 18/08/2022.
//

import Foundation
import SwiftUI

struct NetworkErrorView: View {
    
    var body: some View {
        ZStack(alignment: .center) {
            LottieView(filename: "no_internet_animation", isPaused: false)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

struct NetworkErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkErrorView()
    }
}
