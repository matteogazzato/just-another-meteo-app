//
//  WeatherAPI.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 07/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Alamofire

enum WeatherAPI: APIConfiguration {
    
    case forecastsFrom(_ desc: WeatherAPIClientDescriptor)
    
    var method: HTTPMethod {
        switch self {
        case .forecastsFrom(_):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .forecastsFrom(let desc):
            return "forecast?q=\(desc.city)&cnt=\(desc.days)&APPID=\(NetworkConstants.apiKey)"
        }
    }
            
    func asURLRequest() throws -> URLRequest {
        var url: URL?
        switch self {
        case .forecastsFrom(_):
            url = URL(string:  NetworkConstants.baseUrl + path)
        }
        guard let _url = url else {
            throw APIError.badUrl
        }
        var urlRequest = URLRequest(url: _url)
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .forecastsFrom:
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


