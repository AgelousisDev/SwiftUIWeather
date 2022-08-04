//
//  DotView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 04/08/2022.
//

import Foundation
import SwiftUI

struct DotView: View {
    
    var body: some View {
        Circle()
            .background(Circle().foregroundColor(.accentColor))
    }
    
}

struct DotView_Previews: PreviewProvider {
    
    static var previews: some View {
        DotView()
    }
}
