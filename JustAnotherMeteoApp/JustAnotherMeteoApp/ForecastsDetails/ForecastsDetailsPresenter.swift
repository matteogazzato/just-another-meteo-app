//
//  ForecastsDetailsPresenter.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 09/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation

class ForecastsDetailsPresenter: ForecastsDetailsDataProvider {
    
    fileprivate weak var view: ForecastsDetailsViewProtocol?
    fileprivate let interactor: ForecastsDetailsInteractorProtocol
    fileprivate let wireframe: ForecastsDetailsWireframeProtocol
    
    init(view: ForecastsDetailsViewProtocol,
         interactor: ForecastsDetailsInteractorProtocol,
         wireframe: ForecastsDetailsWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    // MARK: - ForecastsDetailsDataProvider
    // All data provider properties defined
    var forecastDetials: [Forecast] = []
    
    // MARK: - Internal Utils
    // All internal methods not defined in any protocol

}

// MARK: - ForecastsDetailsEventHandler
extension ForecastsDetailsPresenter: ForecastsDetailsEventHandler {
    func onViewDidLoad() {
        // Add onViewDidLoad implementation
    }
    
    func onDismiss() {
        guard let vc = view else { return }
        wireframe.dismiss(vc)
    }
}

// MARK: - ForecastsDetailsInteractorOutput
extension ForecastsDetailsPresenter: ForecastsDetailsInteractorOutput {
    // Add ForecastsDetailsInteractorOutput implementation
}
