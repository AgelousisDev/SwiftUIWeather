//
//  CalendarView.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 02/08/2022.
//

import Foundation
import SwiftUI

struct CalendarRowView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    @State var displayDateTime: String?
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                HStack {
                    Text(displayDateTime ?? "")
                        .font(.headline.weight(.light))
                            .frame(width: geo.size.width * 0.7, alignment: .leading)
                    LottieView(filename: viewModel.weatherResponseModel?.current?.dayStateAnimation ?? "day_animation", isPaused: false)
                            .frame(width: geo.size.width * 0.2, height: 50)
                }
                .padding()
                .onReceive(viewModel.$weatherResponseModel) { _ in
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.configureDisplayDateTime()
                    }
                }
            }
        }
        .frame(height: 100)
    }
    
    private func configureDisplayDateTime() {
        DispatchQueue.main.async {
            switch WeatherNavigationScreen(rawValue: viewModel.selectedTab) {
            case .Today:
                displayDateTime = String(format: "key_last_updated_with_date_label".localized, viewModel.weatherResponseModel?.current?.last_updated?.toDate(pattern: Constants.SERVER_DATE_TIME_FORMAT)?.toDisplayDate(pattern: Constants.DISPLAY_DATE_TIME_FORMAT) ?? "")
            case .Tomorrow:
                displayDateTime = Date().toDisplayDate(pattern: Constants.DISPLAY_DATE_TIME_FORMAT, plusDays: 1)
            default:
                displayDateTime = nil
            }
        }
    }
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarRowView()
            .environmentObject(WeatherViewModel())
    }
}
