//
//  WeatherModel.swift
//  MyWeather
//
//  Created by 장재훈 on 2022/05/17.
//

import Foundation

// Weather api response data

struct WeatherResponse: Codable {
    var lat: Double
    var lon: Double
    var timezone: String
    var timezone_offset: Int
    var daily: [Daily]
    var hourly: [Hourly]
}

struct Daily: Codable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Temp
    var humidity: Int
    var weather: [Weather]
}

struct Hourly: Codable {
    var dt: Int
    var temp: Double
    var weather: [Weather]
}

struct Temp: Codable {
    var min: Double
    var max: Double
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
}
