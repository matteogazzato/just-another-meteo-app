//
//  ForecastsEntities.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation

struct ForecastCellItem {
    let iconUrl: URL?
    let mainLabelText: String
    let secondaryLabelText: String
    
    init(withForecast forecast: Forecast) {
        iconUrl =  NetworkConstants.iconURL(withCodeName: forecast.weather?.icon ?? "")
        secondaryLabelText = forecast.weather?.description ?? "-"
        mainLabelText = forecast.weather?.main ?? "-"
    }
}

