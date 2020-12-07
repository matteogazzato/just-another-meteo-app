//
//  WeatherAPI.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 07/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Alamofire

enum WeatherAPI: APIConfiguration {
    
    case fiveDaysForecastFrom(_ city: String)
    
    var method: HTTPMethod {
        switch self {
        case .fiveDaysForecastFrom(_):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fiveDaysForecastFrom(let city):
            return "forecast?q=\(city)&APPID=\(NetworkConstants.apiKey)"
        }
    }
            
    func asURLRequest() throws -> URLRequest {
        var url: URL?
        switch self {
        case .fiveDaysForecastFrom(_):
            url = URL(string:  NetworkConstants.baseUrl + path)
        }
        guard let _url = url else {
            throw APIError.badUrl
        }
        var urlRequest = URLRequest(url: _url)
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .fiveDaysForecastFrom:
            NSLog("No values to set")
        }
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}


