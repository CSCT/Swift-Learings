//
//  WeatherWidgetProvider.swift
//  WeatherWidgetExtension
//
//  Created by Reade Plunkett on 11/6/23.
//

import WidgetKit

struct Provider : AppIntentTimelineProvider{
    func snapshot(for configuration: LocationAppIntent, in context: Context) async -> WeatherEntry {
                let entry = WeatherEntry(date: Date(), weather: .cloudy,configuration: configuration)
                return entry
    }
    
    func timeline(for configuration: LocationAppIntent, in context: Context) async -> Timeline<WeatherEntry> {
                var entries : [WeatherEntry] = []
        
                let possibleWeathers : [Weather] = [.sunny,.overcast,.cloudy,.rainy,.lightning,.snowy]
        
                let currentDate = Date()
        
                for hourOffset in 0..<5{
                    let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                    let entry = WeatherEntry(date: entryDate, weather: possibleWeathers.randomElement()!,configuration: configuration)
                    entries.append(entry)
                }
        
                let timeline = Timeline(entries: entries, policy: .atEnd)
        
                return timeline
    }
    
    typealias Intent = LocationAppIntent
    
    func placeholder(in context: Context) -> WeatherEntry {
        //Wants new Weather Entry
        return WeatherEntry(date: Date(), weather: .sunny,configuration: LocationAppIntent())
    }
    
    
    typealias Entry = WeatherEntry
    
}
