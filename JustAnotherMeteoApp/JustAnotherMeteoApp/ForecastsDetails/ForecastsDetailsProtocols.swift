//
//  ForecastsDetailsProtocols.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 09/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation
import UIKit

protocol ForecastsDetailsViewProtocol: AnyObject {
	func updateUI()
}

protocol ForecastsDetailsInteractorProtocol: AnyObject {
    // Add ForecastsDetailsInteractorProtocol definition
}

protocol ForecastsDetailsWireframeProtocol: AnyObject {
	func module() -> ForecastsDetailsViewController
    func dismiss(_ ui: ForecastsDetailsViewProtocol)
}

protocol ForecastsDetailsEventHandler: AnyObject {
    func onViewDidLoad()
    func onDismiss()
}

protocol ForecastsDetailsDataProvider: AnyObject {
    // Add ForecastsDetailsDataProvider definition
    var forecastDetials: [Forecast] { get set}
}

protocol ForecastsDetailsInteractorOutput: AnyObject {
    // Add ForecastsDetailsInteractorOutput definition
}

protocol ForecastsDetailsNetworkManagerProtocol: AnyObject {
    // Add ForecastsDetailsNetworkManagerProtocol definition
}
