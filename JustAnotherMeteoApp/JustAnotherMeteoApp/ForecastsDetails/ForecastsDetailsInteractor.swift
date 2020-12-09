//
//  ForecastsDetailsInteractor.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 09/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation

class ForecastsDetailsInteractor {

	fileprivate let networkManager: ForecastsDetailsNetworkManagerProtocol
    weak var output: ForecastsDetailsInteractorOutput?

    init(networkManager: ForecastsDetailsNetworkManagerProtocol = ForecastsDetailsNetworkManager()){
        self.networkManager = networkManager
    }
}

extension ForecastsDetailsInteractor: ForecastsDetailsInteractorProtocol {
	// Add ForecastsDetailsInteractor implementation
}
