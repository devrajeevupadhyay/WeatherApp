//
//  WeatherDataProvider.swift
//  WeatherApp
//
//  Created by Rajeev  Upadhyay on 13/07/25.
//

import Foundation

typealias WeatherResultData = (Result<WeatherData, Error>) -> Void

protocol WeatherDataProviderDelegate {
    func loadWeatherData(completion: @escaping WeatherResultData)
}

class WeatherDataProvider: WeatherDataProviderDelegate {
    func loadWeatherData(completion: @escaping WeatherResultData) {
        guard let url = URL(string: API_URLS.BASE_URL+API_URLS.CURRENT_WEATHER) else {
                    completion(.failure(NSError(domain: "URL Error", code: -1)))
                    return
                }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1)))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(.success(result))
            }
            catch let error {
                completion(.failure(error))
            }
        }
    }
}
