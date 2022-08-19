//
//  SelectionInputFieldRowView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 19/08/2022.
//

import Foundation
import SwiftUI

typealias SelectionInputFieldBlock = (_ position: Int) -> Void

struct SelectionInputFieldRowView: View {
    
    var optionModel: OptionModel
    var selectionInputFieldBlock: SelectionInputFieldBlock
    
    var body: some View {
        HStack {
            
        }
    }
    
}

struct SelectionInputFieldRowView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionInputFieldRowView(optionModel: OptionModel(weatherSettings: WeatherSettings.TemperatureType, label: "key_temperatureTypeLabel".localized, optionList: [("key_temperature_unit_types_array".split(separator: "|").first?.description ?? "", CustomImage.celsiusTemperature)]), selectionInputFieldBlock: { index in
            
        })
    }
}
