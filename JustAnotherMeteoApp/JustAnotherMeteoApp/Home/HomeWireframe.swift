//
//  HomeWireframe.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 06/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit

class HomeWireframe {
    private let nibName = "Home"
}

extension HomeWireframe: HomeWireframeProtocol {
    func module() -> HomeViewController {
        let vc = HomeViewController(nibName: nibName, bundle: nil)

        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: vc, interactor: interactor, wireframe: self)
        vc.eventHandler = presenter
        vc.dataProvider = presenter

        interactor.output = presenter
        return vc
    }
    
    // MARK: - HomeWireframeProtocol
    func dismiss(_ view: HomeViewProtocol) {
        // Add custom implementation to dismiss viewController
    }
}
