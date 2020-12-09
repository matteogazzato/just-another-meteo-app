//
//  ForecastsDetailsWireframe.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 09/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit

class ForecastsDetailsWireframe {
    
    private var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ForecastsDetails", bundle: Bundle.main)
    }
}

extension ForecastsDetailsWireframe: ForecastsDetailsWireframeProtocol {
    
    func module() -> ForecastsDetailsViewController {
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "ForecastsDetailsViewController") as! ForecastsDetailsViewController

        let interactor = ForecastsDetailsInteractor()
        let presenter = ForecastsDetailsPresenter(view: vc, interactor: interactor, wireframe: self)
        vc.eventHandler = presenter
        vc.dataProvider = presenter

        interactor.output = presenter
        return vc
    }
    
    // MARK: - ForecastsDetailsWireframeProtocol
    func dismiss(_ view: ForecastsDetailsViewProtocol) {
        // Add custom implementation to dismiss viewController
    }
}
