//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Mao on 2018/2/21.
//  Copyright © 2018年 Mao. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    func updateUI(forecastWeather: ForecastWeather) {
        self.weatherIcon.image = UIImage(named: forecastWeather.weatherType)
        self.dateLabel.text = forecastWeather.date
        self.weatherTypeLabel.text = forecastWeather.weatherType
        self.highTempLabel.text = forecastWeather.highTemp
        self.lowTempLabel.text = forecastWeather.lowTemp
    }
}
