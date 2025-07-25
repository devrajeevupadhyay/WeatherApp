//
//  ViewController.swift
//  WeatherApp
//
//  Created by Rajeev  Upadhyay on 12/07/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    private var animator: UIViewPropertyAnimator?
    private let animationDuration: TimeInterval = 5.0
    
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var temLbl: UILabel!
    @IBOutlet weak var UnitLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        HomeViewModel(delegate: self).fetchWeatherData()
    }
}

extension ViewController: HomeViewModelDelegate {
    func weatherDataDidFetched(_ weatherData: [CurrentWeatherData]) {
        placeLbl.text = weatherData[0].cityName+weatherData[0].countryCode
        temLbl.text = "\(weatherData[0].temp)"
       
    }
    
    func weatherDataDidFailed(with error: any Error) {
        
    }
}

