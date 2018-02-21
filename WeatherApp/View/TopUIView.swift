//
//  TopUIView.swift
//  WeatherApp
//
//  Created by Mao on 2018/2/21.
//  Copyright © 2018年 Mao. All rights reserved.
//

import UIKit

class TopUIView: UIView {
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var currentTempLabel : UILabel!
    @IBOutlet weak var cityLabel : UILabel!
    @IBOutlet weak var weatherTypeLabel : UILabel!
    @IBOutlet weak var weatherImage : UIImageView!
    
    func updateUI (currentWeather: CurrentWeather) {
        self.dateLabel.text = currentWeather.date
        self.currentTempLabel.text = currentWeather.temp
        self.cityLabel.text = currentWeather.city
        self.weatherTypeLabel.text = currentWeather.weatherType
        self.weatherImage.image = UIImage(named: currentWeather.weatherType)
    }
}
