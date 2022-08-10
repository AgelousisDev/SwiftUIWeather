//
//  HeaderView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 06/08/2022.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    
    let header: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Rectangle()
                .frame(width: 4, height: 20)
                .cornerRadius(8)
                .foregroundColor(.accentColor)
            Text(header)
                .font(.body)
                .fontWeight(.medium)
        }
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        HeaderView(header: "key_app_name_label".localized)
    }
}
