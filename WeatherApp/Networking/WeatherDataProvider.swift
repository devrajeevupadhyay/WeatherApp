//
//  WeatherDataProvider.swift
//  WeatherApp
//
//  Created by Rajeev  Upadhyay on 13/07/25.
//

import Foundation

typealias WeatherResultData = (Result<WeatherData, Error>) -> Void

protocol WeatherDataProviderDelegate {
    func loadWeatherData(lat:String, long:String, completion: @escaping WeatherResultData)
}

class WeatherDataProvider: WeatherDataProviderDelegate {
    func loadWeatherData(lat:String, long:String, completion: @escaping WeatherResultData) {
        let apiUrl = String(format: API_URLS.BASE_URL+API_URLS.CURRENT_WEATHER+API_URLS.WESTHER_PARAMS,"28.5355", "77.3910","82050104ebd54afc8b2f5e744921ca7f" )
        
        let urlStr = "https://api.weatherbit.io/v2.0/current?lat=28.5355&lon=77.3910&key=82050104ebd54afc8b2f5e744921ca7f"
        guard let url = URL(string: apiUrl) else {
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
        }.resume()
    }
}
