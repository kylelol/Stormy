//
//  ViewController.swift
//  Stormy
//
//  Created by Kyle Kirkland on 8/30/15.
//  Copyright (c) 2015 Kyle Kirkland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPercipitationLabel: UILabel?
    @IBOutlet weak var currentWeatherIcon: UIImageView?
    
    private let forecastAPIKey = "b5fdaad10e0fdd8bc678ba07832e2c6a"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.423)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long) {
            (let currently) in
            if let currentWeather = currently {
                dispatch_async(dispatch_get_main_queue()) {
                    
                    if let currentTemp = currentWeather.temperature {
                        self.currentTemperatureLabel?.text = "\(currentTemp)º"
                    }
                    
                    if let humidity = currentWeather.humidity {
                        self.currentHumidityLabel?.text = "\(humidity)%"
                    }
                    
                    if let percipitation = currentWeather.percipProbability {
                        self.currentPercipitationLabel?.text = "\(percipitation)%"
                    }
                    
                    if let image = currentWeather.icon {
                        self.currentWeatherIcon?.image = image
                    }
                    
                }
            }
        }
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

