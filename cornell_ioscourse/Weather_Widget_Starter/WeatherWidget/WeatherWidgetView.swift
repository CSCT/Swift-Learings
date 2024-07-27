//
//  WeatherWidgetView.swift
//  WeatherWidgetExtension
//
//  Created by Reade Plunkett on 11/6/23.
//

import SwiftUI
import WidgetKit

struct WeatherWidgetView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            HStack {
                Text("\(entry.weather.temp)°")
                    .font(.system(size: 32))
                    .minimumScaleFactor(0.5)
                
                Spacer()
                
                Image(systemName: entry.weather.symbol)
                    .resizable()
                    .symbolRenderingMode(.multicolor)
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 20, maxWidth: 40, minHeight: 20, maxHeight: 40)
            }
            Spacer()
            
            HStack {
                Text(entry.configuration.location)
                    .font(.system(size: 16, weight: .bold))
                    .minimumScaleFactor(0.5)
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Text(entry.weather.conditions)
                    .font(.system(size: 16, weight: .bold))
                    .minimumScaleFactor(0.5)
                Spacer()
            }
        }
        .foregroundStyle(.white)
        .containerBackground(Color(entry.weather.color).gradient, for: .widget)
    }
        
}
//
//#Preview(as: .systemSmall) {
//    WeatherWidget()
//} timeline: {
//    WeatherEntry(date: .now, weather: .sunny)
//    WeatherEntry(date: .now, weather: .cloudy)
//    WeatherEntry(date: .now, weather: .overcast)
//    WeatherEntry(date: .now, weather: .rainy)
//    WeatherEntry(date: .now, weather: .lightning)
//    WeatherEntry(date: .now, weather: .snowy)
//}
