//
//  Location.swift
//  WeatherApp
//
//  Created by Mao on 2018/2/21.
//  Copyright © 2018年 Mao. All rights reserved.
//

import Foundation

class Location {

    static var sharedInstance = Location()
    private init(){}
    
    
    private var _latitude : Double!
    private var _longitude : Double!
    
    var latitude : Double {
        set {
            _latitude = Double(newValue)
        } get {
          return _latitude
        }
    }
    var longitude : Double {
        set {
            _longitude = Double(newValue)
        } get {
            return _longitude
        }
    }
    
}
