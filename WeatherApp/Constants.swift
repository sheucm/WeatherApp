//
//  Constants.swift
//  WeatherApp
//
//  Created by Mao on 2018/2/21.
//  Copyright © 2018年 Mao. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()


// From Open Weather Data
let API_KEY = "82edab6a7f02a7ed9acb273bff44acef"

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude)&lon=\(Location.sharedInstance.longitude)&appid=\(API_KEY)"

let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=\(Location.sharedInstance.latitude)&lon=\(Location.sharedInstance.longitude)&appid=\(API_KEY)"




