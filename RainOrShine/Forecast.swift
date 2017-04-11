//
//  Forecast.swift
//  RainOrShine
//
//  Created by Laren Sakota on 4/10/17.
//  Copyright © 2017 3..2..1..GO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: Int!
    var _lowTemp: Int!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
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
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                    
                let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
                
                let kelvinToFarenheit = Double(10 * kelvinToFarenheitPreDivision/10)
                
                self._lowTemp = Int(round(kelvinToFarenheit))
                
                }
            
            if let max = temp["max"] as? Double {
                
                let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
                
                let kelvinToFarenheit = Double(10 * kelvinToFarenheitPreDivision/10)
                
                self._highTemp = Int(round(kelvinToFarenheit))
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}


