//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Kyle Kirkland on 8/30/15.
//  Copyright (c) 2015 Kyle Kirkland. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
    let temperature: Int
    let humidity: Int
    let percipProbability: Int
    let summary: String
    
    
    init(weatherDictionary: [String: AnyObject]) {
        
        temperature = weatherDictionary["temperature"] as! Int
        let humidityFloat = weatherDictionary["humidity"] as! Double
        humidity = Int(humidityFloat*100)
        let percipFloat = weatherDictionary["precipProbability"] as! Double
        percipProbability = Int(percipFloat*100)
        summary = weatherDictionary["summary"] as! String
    }
    
}
