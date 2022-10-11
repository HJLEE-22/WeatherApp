//
//  WeatherDataManager.swift
//  WeatherApp
//
//  Created by 이형주 on 2022/10/11.
//

import UIKit

public struct WeatherAPI {
    static let requestUrl = "http://api.weatherplanet.co.kr/weather/current/minutely?version=2.5&"

}



// MARK: - Error 정의

enum NetworkError:Error {
    case networkingError
    case dataError
    case parseError
}


class TodayWeatherDataManager {
    
    static let shared = TodayWeatherDataManager()
    private init(){}
    
    typealias NetworkCompletion = (Result<[WeatherData], NetworkError>)-> Void

    
    
    func fetchWeatherByLatAndLon(latitude: String, longitude: String, completion: @escaping NetworkCompletion) {
        
        
        let requestByLatAndLon = "lat=\(latitude)&lon=\(longitude)"

        let urlString = "\(WeatherAPI.requestUrl)\(requestByLatAndLon)"
        
        performRequest(with: urlString) { result in
            completion(result)
        }
        
        
    }
    
    
    func fetchWeatherByName(city: String, county: String, village: String, completion: @escaping NetworkCompletion) {
        
        let requestByName = "city=\(city)&county=\(county)&village=\(village)"

        let urlString = "\(WeatherAPI.requestUrl)\(requestByName)"

        performRequest(with: urlString) { result in
            completion(result)
        }
        
    }
    
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                // completion에 에러타입 전달
                return
            }
            guard let safeData = data else {
                // completion에 에러타입 전달
                return
            }
            if let weather = self.parseJSON(safeData) {
                print("DEBUG: parse 실행")
                completion(.success([weather]))
            } else {
                print("DEBUG: parse 실패")
                completion(.failure(.parseError))
            }
            
        }
        task.resume()
    }
    
    
    private func parseJSON(_ weatherData: Data) -> WeatherData? {
        
        do {
            let parsedWeatherData = try JSONDecoder().decode(WeatherData.self, from: weatherData)
            return parsedWeatherData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    

/*
    let url = URL(string: "http://api.weatherplanet.co.kr/weather/current/minutely?version={version}&lat={latitude}&lon={longitude}")!
    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("gzip,deflate,sdch", forHTTPHeaderField: "Accept-Encoidng")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("xxxxxxxxxxxxxx", forHTTPHeaderField: "appKey")

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let response = response {
        print(response)

        if let data = data, let body = String(data: data, encoding: .utf8) {
          print(body)
        }
      } else {
        print(error ?? "Unknown error")
      }
    }

    task.resume()
 
 */
    
}
