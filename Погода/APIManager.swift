//
//  APIManager.swift
//  Погода
//
//  Created by admin on 23.5.23.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    let urlString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true&hourly=temperature_2m"
    
    func getWeather(completion: @escaping ([String]) -> Void) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion([])
                return
            }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                let temperatureData = weatherData.hourly.temperature2M
                completion(temperatureData)
            } catch {
                print("Failed to decode weather data: \(error)")
                completion([])
            }
        }
        
        task.resume()
    }
}
