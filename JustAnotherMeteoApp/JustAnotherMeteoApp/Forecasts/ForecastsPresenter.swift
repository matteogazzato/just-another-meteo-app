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
    fileprivate weak var delegate: ForecastsDelegate?
    
    init(view: ForecastsViewProtocol,
         interactor: ForecastsInteractorProtocol,
         wireframe: ForecastsWireframeProtocol,
         delegate: ForecastsDelegate?) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.delegate = delegate
    }
    
    // MARK: - ForecastsDataProvider
    // All data provider properties defined
    var forecasts: [ForecastDescriptor] = []
    
    // MARK: - Internal Utils
    // All internal methods not defined in any protocol

}

// MARK: - ForecastsEventHandler
extension ForecastsPresenter: ForecastsEventHandler {
    func onItemSelected(atIndex index: Int) {
        delegate?.onDescriptorSelected(forecasts[index])
    }
    
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
