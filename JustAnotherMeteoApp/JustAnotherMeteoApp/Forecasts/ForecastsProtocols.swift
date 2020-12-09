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
    func module(withDelegate delegate: ForecastsDelegate?) -> ForecastsViewController
    func dismiss(_ ui: ForecastsViewProtocol)
}

protocol ForecastsEventHandler: AnyObject {
    func onViewDidLoad()
    func onDismiss()
    func onItemSelected(atIndex index: Int)
}

protocol ForecastsDataProvider: AnyObject {
    // Add ForecastsDataProvider definition
    var forecasts: [ForecastDescriptor] { get set }
}

protocol ForecastsInteractorOutput: AnyObject {
    // Add ForecastsInteractorOutput definition
}

protocol ForecastsNetworkManagerProtocol: AnyObject {
    // Add ForecastsNetworkManagerProtocol definition
}

protocol ForecastsDelegate: AnyObject {
    func onDescriptorSelected(_ descriptor: ForecastDescriptor)
}

