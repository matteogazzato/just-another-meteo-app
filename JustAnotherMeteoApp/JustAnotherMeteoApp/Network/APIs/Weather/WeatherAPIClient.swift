//
//  WeatherAPIClient.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 07/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Alamofire
import RxSwift

struct WeatherAPIClientDescriptor {
    let city: String
}

class WeatherAPIClient {
    static func forecastsWeather(fromDescriptor desc: WeatherAPIClientDescriptor ) -> Observable<ForecastsResponse> {
        return NetworkClient.request(WeatherAPI.forecastsFrom(desc))
    }
}



