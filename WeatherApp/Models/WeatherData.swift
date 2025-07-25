//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Rajeev  Upadhyay on 13/07/25.
//
import Foundation

struct WeatherData : Decodable {
    let count: Int
    let currentWeatherData: [CurrentWeatherData]
    
    enum CodingKeys: String, CodingKey {
        case count
        case currentWeatherData = "data"
    }
}


struct CurrentWeatherIconDetail: Decodable {
    let icon:String
    let code:Int
    let description:String
}


// MARK: - CurrentWeatherData
struct CurrentWeatherData: Decodable {
    let appTemp: Double
    let aqi: Int
    let cityName: String
    let clouds: Int
    let countryCode, datetime: String
    let dewpt: Double
    let dhi, dni: Int
    let elevAngle: Double
    let ghi: Int
    let gust: Double
    let hAngle: Int
    let lat, lon: Double
    let obTime, pod: String
    let precip, pres, rh, slp: Int
    let snow, solarRAD: Int
    let sources: [String]
    let stateCode, station, sunrise, sunset: String
    let temp: Double
    let timezone: String
    let ts, uv, vis: Int
    let weather: CurrentWeatherIconDetail
    let windCdir, windCdirFull: String
    let windDir: Int
    let windSpd: Double

    enum CodingKeys: String, CodingKey {
        case appTemp = "app_temp"
        case aqi
        case cityName = "city_name"
        case clouds
        case countryCode = "country_code"
        case datetime, dewpt, dhi, dni
        case elevAngle = "elev_angle"
        case ghi, gust
        case hAngle = "h_angle"
        case lat, lon
        case obTime = "ob_time"
        case pod, precip, pres, rh, slp, snow
        case solarRAD = "solar_rad"
        case sources
        case stateCode = "state_code"
        case station, sunrise, sunset, temp, timezone, ts, uv, vis, weather
        case windCdir = "wind_cdir"
        case windCdirFull = "wind_cdir_full"
        case windDir = "wind_dir"
        case windSpd = "wind_spd"
    }
}

