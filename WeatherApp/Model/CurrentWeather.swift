//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Mao on 2018/2/21.
//  Copyright © 2018年 Mao. All rights reserved.
//

import UIKit

class CurrentWeather {

    private var _date : String!
    private var _weatherType : String!
    private var _temp : String!
    private var _city : String!
    
    var date : String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .medium
        _date = dateFormatter.string(from: Date())
        return "Today, " + _date
    }
    var weatherType : String {
        if _weatherType == nil{
            return ""
        }
        return _weatherType
    }
    var temp : String {
        if _temp == nil{
            return ""
        }
        return _temp + "ºC"
    }
    var city : String {
        if _city == nil{
            return ""
        }
        return _city
    }
    
    
    func configure (obj: Dictionary<String, Any>) {
        if let weather = obj["weather"] as? [Dictionary<String, Any>] {
            if let weatherType = weather[0]["main"] as? String {
                self._weatherType = weatherType.capitalized
            }
        }
        if let main = obj["main"] as? Dictionary<String, Any> {
            if let kelvinTemp = main["temp"] as? Double {
                let celiusTemp = kelvinTemp - 272.15
                self._temp = "\(Int(celiusTemp))"
            }
        }
        if let city = obj["name"] as? String {
            self._city = city.capitalized
        }
    }
    
    
}
