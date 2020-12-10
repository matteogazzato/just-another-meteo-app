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
    func retrieveForecasts(forCity city: String, days: Int = 1) {
        let desc = WeatherAPIClientDescriptor(city: city)
        _ = WeatherAPIClient.forecastsWeather(fromDescriptor: desc)
            .subscribe { response in
                self.output?.onForecastsReceived(self.mapResponse(response))
            } onError: { _ in
                self.output?.onError()
            }
    }
}

// MARK: - Internal Utils
extension HomeInteractor {
    private func mapResponse(_ response: ForecastsResponse) -> [ForecastDescriptor] {
        let forecastsDict = Dictionary(grouping: response.forecasts) {
            Helpers.convert(dateString: $0.date,
                            withFormat: "yyyy-MM-dd HH:mm:ss",
                            toFormat: "dd EEEE")
            
        }
        
        let goupedForecasts = forecastsDict.map {
            ForecastDescriptor(day: $0.key ?? "", icon: $0.value.first?.weather?.icon ?? "")
        }.sorted { $0.day < $1.day }
        
        let forecastsDescriptor = goupedForecasts.map {
            ForecastDescriptor(day: $0.day,
                               icon: $0.icon,
                               forecasts: forecastsDict[$0.day] ?? [])
        }
        
        return forecastsDescriptor
    }
}
