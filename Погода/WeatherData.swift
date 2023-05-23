//
//  WeatherData.swift
//  Погода
//
//  Created by admin on 23.5.23.
//

import Foundation

struct WeatherData: Codable {
    let latitude, longitude, generationtimeS: Double
    let utcoffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let hourlyUnits: HourlyUnits
    let hourly: Hourly
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeS = "generationtime_ms"
        case utcoffsetSeconds = "utcoffsetseconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case hourlyUnits = "hourly_units"
        case hourly
    }
}

struct Hourly: Codable {
    let time: [String]
    let temperature2M: [Double]
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
    }
}

struct HourlyUnits: Codable {
    let time, temperature2M: String
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
    }
}

