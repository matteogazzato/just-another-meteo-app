//
//  ForecastsProtocols.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation
import UIKit

protocol ForecastsViewProtocol: AnyObject {
	func updateUI()
}

protocol ForecastsInteractorProtocol: AnyObject {
    // Add ForecastsInteractorProtocol definition
}

protocol ForecastsWireframeProtocol: AnyObject {
	func module() -> ForecastsViewController
    func dismiss(_ ui: ForecastsViewProtocol)
}

protocol ForecastsEventHandler: AnyObject {
    func onViewDidLoad()
    func onDismiss()
}

protocol ForecastsDataProvider: AnyObject {
    // Add ForecastsDataProvider definition
    var forecasts: [Forecast] { get set }
}

protocol ForecastsInteractorOutput: AnyObject {
    // Add ForecastsInteractorOutput definition
}

protocol ForecastsNetworkManagerProtocol: AnyObject {
    // Add ForecastsNetworkManagerProtocol definition
}
