//
//  ForecastsPresenter.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation

class ForecastsPresenter: ForecastsDataProvider {
    
    fileprivate weak var view: ForecastsViewProtocol?
    fileprivate let interactor: ForecastsInteractorProtocol
    fileprivate let wireframe: ForecastsWireframeProtocol
    
    init(view: ForecastsViewProtocol,
         interactor: ForecastsInteractorProtocol,
         wireframe: ForecastsWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    // MARK: - ForecastsDataProvider
    // All data provider properties defined
    var forecasts: [Forecast] = []
    
    // MARK: - Internal Utils
    // All internal methods not defined in any protocol

}

// MARK: - ForecastsEventHandler
extension ForecastsPresenter: ForecastsEventHandler {
    func onViewDidLoad() {
        // Add onViewDidLoad implementation
    }
    
    func onDismiss() {
        guard let vc = view else { return }
        wireframe.dismiss(vc)
    }
}

// MARK: - ForecastsInteractorOutput
extension ForecastsPresenter: ForecastsInteractorOutput {
    // Add ForecastsInteractorOutput implementation
}
