//
//  ForecastsWireframe.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit

class ForecastsWireframe {
    
    private var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Forecasts", bundle: Bundle.main)
    }
}

extension ForecastsWireframe: ForecastsWireframeProtocol {
    
    func module(withDelegate delegate: ForecastsDelegate?) -> ForecastsViewController {
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "ForecastsViewController") as! ForecastsViewController

        let interactor = ForecastsInteractor()
        let presenter = ForecastsPresenter(view: vc, interactor: interactor, wireframe: self, delegate: delegate)
        vc.eventHandler = presenter
        vc.dataProvider = presenter

        interactor.output = presenter
        return vc
    }
    
    // MARK: - ForecastsWireframeProtocol
    func dismiss(_ view: ForecastsViewProtocol) {
        // Add custom implementation to dismiss viewController
    }
}
