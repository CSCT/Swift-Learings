//
//  Weather.swift
//  WeatherWidgetExtension
//
//  Created by Reade Plunkett on 11/6/23.
//

struct Weather {
    let conditions: String
    let symbol: String
    let color: String
    let temp: Int
    
    static let sunny = Weather(conditions: "Sunny", symbol: "sun.max.fill", color: "sunny-color", temp: 78)
    static let cloudy = Weather(conditions: "Cloudy", symbol: "cloud.sun.fill", color: "cloudy-color", temp: 64)
    static let overcast = Weather(conditions: "Overcast", symbol: "cloud.fill", color: "overcast-color", temp: 45)
    static let rainy = Weather(conditions: "Rainy", symbol: "cloud.rain.fill", color: "rainy-color", temp: 62)
    static let lightning = Weather(conditions: "Lightning", symbol: "cloud.bolt.fill", color: "lightning-color", temp: 57)
    static let snowy = Weather(conditions: "Snowy", symbol: "snowflake", color: "snowy-color", temp: 18)
}
