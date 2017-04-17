//
//  CurrentWeather.swift
//  RainOrShine
//
//  Created by Laren Sakota on 3/27/17.
//  Copyright © 2017 3..2..1..GO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Int!
    var _highTemp: Int!
    var _lowTemp: Int!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Int {
        if _currentTemp == nil {
            _currentTemp = 0
        }
        return _currentTemp
    }
    
    var highTemp: Int {
        if _highTemp == nil {
            _highTemp = 0
        }
        return _highTemp
    }
    
    var lowTemp: Int {
        if _lowTemp == nil {
            _lowTemp = 0
        }
        return _lowTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire download
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                   
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let kelvinToFarenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                        
                        let kelvinToFarenheit = Double(10 * kelvinToFarenheitPreDivision/10)
                        
                        self._currentTemp = Int(round(kelvinToFarenheit))
                        print(self._currentTemp)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let highTemperature = main["temp_max"] as? Double {
                        let kelvinToFarenheit = (1.8 * (highTemperature - 273.15) + 32)
                        self._highTemp = Int(kelvinToFarenheit)
                        print(self._highTemp)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let lowTemperature = main["temp_min"] as? Double {
                        let kelvinToFarenheit = (1.8 * (lowTemperature - 273.15) + 32)
                        self._lowTemp = Int(kelvinToFarenheit)
                        print(self._lowTemp)
                    }
                }
            }
        completed()
        }
    }
}
