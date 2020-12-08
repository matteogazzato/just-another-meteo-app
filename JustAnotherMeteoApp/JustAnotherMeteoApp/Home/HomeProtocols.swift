//
//  HomeProtocols.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 06/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
	func updateUI()
    func add(childViewController vc: UIViewController)
}

protocol HomeInteractorProtocol: AnyObject {
    // Add HomeInteractorProtocol definition
    func retrieveForecasts(forCity city: String, days: Int)
}

protocol HomeWireframeProtocol: AnyObject {
	func module() -> HomeViewController
    func dismiss(_ vc: HomeViewProtocol)
}

protocol HomeEventHandler: AnyObject {
    func onViewDidLoad()
    func onDismiss()
    func onSearch(withText text: String)
}

protocol HomeDataProvider: AnyObject {
    // Add HomeDataProvider definition
}

protocol HomeInteractorOutput: AnyObject {
    // Add HomeInteractorOutput definition
    func onForecastsReceived(_ forecasts: [Forecast])
    func onError()
}

protocol HomeDelegate: AnyObject {
    // Add HomeDelegate definition
}

protocol HomeNetworkManagerProtocol: AnyObject {
    // Add HomeNetworkManagerProtocol definition
    
}
