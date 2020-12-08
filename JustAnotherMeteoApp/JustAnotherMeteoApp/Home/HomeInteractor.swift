//
//  HomeInteractor.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 06/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation

class HomeInteractor {

	fileprivate let networkManager: HomeNetworkManagerProtocol
    weak var output: HomeInteractorOutput?

    init(networkManager: HomeNetworkManagerProtocol = HomeNetworkManager()){
        self.networkManager = networkManager
    }
}

extension HomeInteractor: HomeInteractorProtocol {
    // Add NextLaunchesInteractorProtocol implementation
    func retrieveForecasts(forCity city: String, days: Int = 5) {
        let desc = WeatherAPIClientDescriptor(city: city, days: days)
        _ = WeatherAPIClient.forecastsWeather(fromDescriptor: desc)
            .subscribe { response in
                self.output?.onForecastsReceived(response.forecasts)
            } onError: { _ in
                self.output?.onError()
            }
    }
}
