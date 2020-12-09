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
    
    init(withForecast forecast: ForecastDescriptor) {
        iconUrl =  NetworkConstants.iconURL(withCodeName: forecast.icon)
        mainLabelText = forecast.day
    }
}

struct ForecastDescriptor {
    let day: String
    let icon: String
    var forecasts: [Forecast] = []
}

