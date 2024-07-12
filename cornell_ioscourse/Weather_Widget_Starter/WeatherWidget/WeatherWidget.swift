//
//  WeatherWidget.swift
//  WeatherWidgetExtension
//
//  Created by Reade Plunkett on 11/6/23.
//

import WidgetKit
import SwiftUI

struct WeatherWidget : Widget{
    let kind: String = "WeatherWidget"
    
    var body: some WidgetConfiguration{
        AppIntentConfiguration(kind: kind, provider: Provider()) { entry in
            WeatherWidgetView(entry: entry)
        }
        .configurationDisplayName("Forecast")
        .description("View the weather widget for your location")
        .supportedFamilies([.systemSmall,.systemMedium,.systemLarge,.accessoryRectangular])
    }
}
