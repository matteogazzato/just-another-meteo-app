//
//  WeatherAPIClient.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 07/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Alamofire
import RxSwift

class WeatherAPIClient {
    static func fiveDaysWeather(fromCity city: String) -> Observable<FiveDaysForecastResponse> {
        return NetworkClient.request(WeatherAPI.fiveDaysForecastFrom(city))
    }
}

