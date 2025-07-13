//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Rajeev  Upadhyay on 13/07/25.
//
import Foundation

struct WeatherData : Decodable {
    let currentWeatherData: [CurrentWeatherData]
}

struct CurrentWeatherData : Decodable {
    let city_name:String
    let sunrise:Date
    let sunset:Date
    let ob_time:Date
    let pres:Double
    let wind_spd:Double
    let gust:String
    let wind_dir:String
    let temp:Double
    let app_temp:Double
    let rh:String
    let dewpt:String
    let clouds:String
    let weather:CurrentWeatherIconDetail
    let vis:String
    let precip:Double
    let snow:Double
    let uv:Double
    let aqi:Int
}

struct CurrentWeatherIconDetail: Decodable {
    let icon:String
    let code:Int
    let description:String
}
