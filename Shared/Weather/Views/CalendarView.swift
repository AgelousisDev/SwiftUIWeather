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
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: VerticalAlignment.center) {
                Text(String(format: "key_last_updated_with_date_label".localized, displayDateTime ?? ""))
                    .font(.headline)
                    .frame(width: geo.size.width * 0.7, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                LottieView(lottieFile: $viewModel.weatherResponseModel.wrappedValue?.current?.dayStateAnimation ?? "day_animation")
                    .frame(width: geo.size.width * 0.2, height: 50, alignment: .center)
            }
            .padding()
            .onAppear {
                configureDisplayDateTime()
            }
        }
    }
    
    private func configureDisplayDateTime() {
        switch WeatherNavigationScreen(rawValue: viewModel.selectedTab) {
        case .Today:
            displayDateTime = viewModel.weatherResponseModel?.current?.last_updated?.toDate(pattern: Constants.SERVER_DATE_TIME_FORMAT)?.toDisplayDate(pattern: Constants.DISPLAY_DATE_TIME_FORMAT)
        case .Tomorrow:
            displayDateTime = viewModel.weatherResponseModel?.current?.last_updated?.toDate(pattern: Constants.SERVER_DATE_TIME_FORMAT)?.toDisplayDate(pattern: Constants.DISPLAY_DATE_TIME_FORMAT, plusDays: 1)
        default:
            displayDateTime = nil
        }
    }
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(WeatherViewModel())
    }
}
