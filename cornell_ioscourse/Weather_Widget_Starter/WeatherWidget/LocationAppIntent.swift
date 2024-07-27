//
//  LocationAppIntent.swift
//  WeatherWidgetExtension
//
//  Created by Graceson Thompson on 11/12/23.
//

import Foundation
import WidgetKit
import AppIntents

struct LocationAppIntent: WidgetConfigurationIntent{
    static var title : LocalizedStringResource = "Location"
    
    @Parameter(title: "Location", default: "Ithaca, NY")
    var location : String
}
