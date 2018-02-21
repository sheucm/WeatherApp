//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mao on 2018/2/21.
//  Copyright © 2018年 Mao. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var topUIView : TopUIView!
    @IBOutlet weak var tableView : UITableView!
    
    var currentWeather = CurrentWeather()
    var forecastWeathers = [ForecastWeather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        downloadCurrentWeather() {
            self.topUIView.updateUI(currentWeather: self.currentWeather)
        }
        downloadForecastWeather {
            self.forecastWeathers.remove(at: 0)
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastWeathers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
            
            let forecastWeather = forecastWeathers[indexPath.row]
            cell.updateUI(forecastWeather: forecastWeather)
            return cell
        }
        return WeatherCell()
    }
    
    
    func downloadCurrentWeather(complete: @escaping DownloadComplete) {
        let url = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(url).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, Any> {
                self.currentWeather.configure(obj: dict)
            }
            complete()
        }
    }
    
    func downloadForecastWeather(complete: @escaping DownloadComplete) {
        let url = URL(string: FORECAST_WEATHER_URL)!
        Alamofire.request(url).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, Any> {
                if let list = dict["list"] as? [Dictionary<String, Any>] {
                    for obj in list {
                        let forecastWeather = ForecastWeather(obj: obj)
                        self.forecastWeathers.append(forecastWeather)
                    }
                }
            }
            complete()
        }
    }
    
    
    
    
    
}

