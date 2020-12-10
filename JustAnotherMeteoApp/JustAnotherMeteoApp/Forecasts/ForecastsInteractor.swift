//
//  ForecastsInteractor.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation

class ForecastsInteractor {

	fileprivate let networkManager: ForecastsNetworkManagerProtocol
    weak var output: ForecastsInteractorOutput?

    init(networkManager: ForecastsNetworkManagerProtocol = ForecastsNetworkManager()){
        self.networkManager = networkManager
    }
}

extension ForecastsInteractor: ForecastsInteractorProtocol {
	// Add ForecastsInteractor implementation
}
