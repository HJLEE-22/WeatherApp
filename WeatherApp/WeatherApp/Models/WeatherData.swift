//
//  WeatherData.swift
//  WeatherApp
//
//  Created by 이형주 on 2022/10/11.
//


import UIKit

struct WeatherData: Codable {
    
    let temperature: [Temperature]
    let humidity: String
    let sky: [Sky]
    let nearValue: [NearValue]

//    enum CodingKeys: String, CodingKey {
//        case temperature
//        case humidity
//        case sky
//        case nearValue
//    }
}


struct Temperature: Codable {
    let tc: String?
    let tmax: String
    let tmin: String
}

struct Sky: Codable {
    let code: String
    let name: String
}

struct NearValue: Codable {
    let temperature: [Temperature]
    let humidity: String
    let sky: [Sky]
    
//    enum CodingKeys: String, CodingKey {
//        case temperature
//        case humidity
//        case sky
//    }
}

/*
 
 {
   "weather": {
     "minutely": [
       {
         "station": {
           "longitude": "127.0657778000",
           "latitude": "37.1373888900",
           "name": "남촌",
           "id": "446",
           "type": "KMA"
         },
         "wind": {
           "wdir": "287.00",
           "wspd": "2.80"
         },
         "precipitation": {
           "sinceOntime": "0.00",
           "type": "0"
         },
         "sky": {
           "code": "SKY_A01",
           "name": "맑음"
         },
         "rain": {
           "sinceOntime": "0.00",
           "sinceMidnight": "0.00",
           "last10min": "0.00",
           "last15min": "0.00",
           "last30min": "0.00",
           "last1hour": "0.00",
           "last6hour": "0.00",
           "last12hour": "0.00",
           "last24hour": "0.00"
         },
         "temperature": {
           "tc": "22.10",
           "tmax": "24.00",
           "tmin": "14.00"
         },
         "humidity": "",
         "pressure": {
           "surface": "",
           "seaLevel": ""
         },
         "lightning": "0",
         "timeObservation": "2017-05-25 16:53:00",
         "nearValue": {
           "temperature": {
             "tc": "21.50",
             "tmax": "25.00",
             "tmin": "13.00"
           },
           "humidity": "69.30",
           "sky": {
             "code": "SKY_A01",
             "name": "맑음"
           }
         }
       }
     ]
   },
   "common": {
     "alertYn": "Y",
     "stormYn": "N"
   },
   "result": {
     "code": 9200,
     "requestUrl": "/weather/current/minutely?version=2.5&lat=37.123&lon=127.123",
     "message": "성공"
   }
 }
 
 */
