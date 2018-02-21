//
//  ForecastWeather.swift
//  WeatherApp
//
//  Created by Mao on 2018/2/21.
//  Copyright © 2018年 Mao. All rights reserved.
//

import UIKit

class ForecastWeather {
    private var _date : String!
    private var _weatherType : String!
    private var _lowTemp : String!
    private var _highTemp : String!
    
    var date : String {
        if _date == nil{
            return ""
        }
        return _date
    }
    var weatherType : String {
        if _weatherType == nil{
            return ""
        }
        return _weatherType
    }
    var lowTemp : String {
        if _lowTemp == nil{
            return ""
        }
        return _lowTemp
    }
    var highTemp : String {
        if _highTemp == nil{
            return ""
        }
        return _highTemp
    }
    
    init (obj: Dictionary<String, Any>) {
        if let date = obj["dt"] as? Double {
            let dateConvertedUnix = Date(timeIntervalSince1970: date)
            self._date = dateConvertedUnix.dayOfTheWeek()
        }
        if let main = obj["main"] as? Dictionary<String, Any> {
            if let temp_min = main["temp_min"] as? Double {
                let celciusTemp = temp_min - 272.15
                self._lowTemp = "\(Int(celciusTemp))"
            }
            if let temp_max = main["temp_max"] as? Double {
                let celciusTemp = temp_max - 272.15
                self._highTemp = "\(Int(celciusTemp))"
            }
        }
        if let weather = obj["weather"] as? [Dictionary<String, Any>] {
            if let weatherType = weather[0]["main"] as? String {
                self._weatherType = weatherType.capitalized
            }
        }
    }
    
}

extension Date {
    func dayOfTheWeek () -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "EEEE HH:00"
        return dateFormatter.string(from: self)
    }
}



