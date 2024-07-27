//
//  WeatherWidgetEntry.swift
//  WeatherWidgetExtension
//
//  Created by Reade Plunkett on 11/6/23.
//

import WidgetKit

struct WeatherEntry : TimelineEntry{
    var date: Date
    var weather: Weather
    
    let configuration: LocationAppIntent
}
