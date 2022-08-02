//
//  CalendarView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 02/08/2022.
//

import Foundation
import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    @State var displayDateTime: String?
    
    init() {
        switch viewModel.$selectedTab.wrappedValue {
        case .Today:
            displayDateTime = viewModel.$weatherResponseModel.wrappedValue?.current?.last_updated?.toDate(pattern: Constants.SERVER_DATE_TIME_FORMAT)?.toDisplayDate(pattern: Constants.DISPLAY_DATE_TIME_FORMAT)
        case .Tomorrow:
            displayDateTime = viewModel.weatherResponseModel?.current?.last_updated?.toDate(pattern: Constants.SERVER_DATE_TIME_FORMAT)?.toDisplayDate(pattern: Constants.DISPLAY_DATE_TIME_FORMAT, plusDays: 1)
        default:
            displayDateTime = nil
        }
    }
    
    var body: some View {
        HStack {
            Text(String(format: "key_last_updated_with_date_label", displayDateTime ?? ""))
                .font(.title2)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            LottieView(lottieFile: viewModel.$weatherResponseModel.wrappedValue?.current?.dayStateAnimation ?? "day_animation")
                .frame(width: 300, height: 300)
        }
    }
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
