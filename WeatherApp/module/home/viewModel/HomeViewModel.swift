//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Rajeev  Upadhyay on 14/07/25.
//

import Foundation

protocol HomeViewModelDelegate : AnyObject {
    func weatherDataDidFetched(_ weatherData: [CurrentWeatherData])
    func weatherDataDidFailed(with error:Error)
}

class HomeViewModel {
    private let weatherDataProviderDelegate: WeatherDataProviderDelegate
    weak var delegate:HomeViewModelDelegate?
    init(weatherDataProvider: WeatherDataProviderDelegate = WeatherDataProvider(), delegate:HomeViewModelDelegate ) {
            self.weatherDataProviderDelegate = weatherDataProvider
           self.delegate = delegate
    }
    
    func fetchWeatherData() {
       weatherDataProviderDelegate.loadWeatherData(lat: "28.5355", long: "77.3910") {[weak self] result in
            switch result {
            case .success(let weatherData) :
                self?.delegate?.weatherDataDidFetched(weatherData.currentWeatherData)
            case .failure(let error) :
                self?.delegate?.weatherDataDidFailed(with: error)
            }
        }
    }
}
