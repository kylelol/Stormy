//
//  ForecastService.swift
//  Stormy
//
//  Created by Kyle Kirkland on 8/30/15.
//  Copyright (c) 2015 Kyle Kirkland. All rights reserved.
//

import Foundation

struct ForecastService {
    
    let forecastAPIKey: String
    let forecastBaseURL: NSURL?
    
    init(APIKey: String) {
        forecastAPIKey = APIKey
        forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    }
    
    func getForecast(lat: Double, long: Double, completion: (CurrentWeather? -> Void)) {
        
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL) {
            
            let networkOperation = NetworkOperation(url: forecastURL)
            networkOperation.downloadJSONFromURL {
                (let jsonDictionary) in
                let currentWeather = self.currentWeatherFromJSON(jsonDictionary)
                completion(currentWeather)
            }
            
        } else {
            
        }

    }
    
    func currentWeatherFromJSON(jsonDictionary: [String: AnyObject]?) -> CurrentWeather? {
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject] {
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        } else {
            return nil
        }
    }
    
    
}
