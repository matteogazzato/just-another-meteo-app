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
}

protocol HomeInteractorProtocol: AnyObject {
    // Add HomeInteractorProtocol definition
}

protocol HomeWireframeProtocol: AnyObject {
	func module() -> HomeViewController
    func dismiss(_ vc: HomeViewProtocol)
}

protocol HomeEventHandler: AnyObject {
    func onViewDidLoad()
    func onDismiss()
    func onSearch()
}

protocol HomeDataProvider: AnyObject {
    // Add HomeDataProvider definition
}

protocol HomeInteractorOutput: AnyObject {
    // Add HomeInteractorOutput definition
}

protocol HomeDelegate: AnyObject {
    // Add HomeDelegate definition
}

protocol HomeNetworkManagerProtocol: AnyObject {
    // Add HomeNetworkManagerProtocol definition
}
