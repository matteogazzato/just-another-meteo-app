//
//  ForecastsDetailsEntities.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 09/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation

struct ForecastsDetailsCellItem {
    let iconUrl: URL?
    let primaryLabelText: String
    let secondaryLabelText: String
    
    init(withForecast forecast: Forecast) {
        iconUrl =  NetworkConstants.iconURL(withCodeName: forecast.weather?.icon ?? "")
        let hour = Helpers.convert(dateString: forecast.date, withFormat: "yyyy-MM-dd HH:mm:ss", toFormat: "HH:mm") ?? ""
        let description = forecast.weather?.description ?? ""
        primaryLabelText = hour + " - " + description
        secondaryLabelText = "Humidity: \(forecast.humidity) - Temperature: \(forecast.temperature)"
    }
}
