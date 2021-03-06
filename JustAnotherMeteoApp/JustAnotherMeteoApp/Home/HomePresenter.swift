//
//  HomePresenter.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 06/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation

class HomePresenter: HomeDataProvider {

    fileprivate weak var view: HomeViewProtocol?
    fileprivate let interactor: HomeInteractorProtocol
    fileprivate let wireframe: HomeWireframeProtocol
    
    init(view: HomeViewProtocol,
         interactor: HomeInteractorProtocol,
         wireframe: HomeWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    // MARK: - HomeDataProvider
    // All data provider properties defined
    
    // MARK: - Internal Utils
    // All internal methods not defined in any protocol
    
}

// MARK: - HomeEventHandler
extension HomePresenter: HomeEventHandler {
    func onViewDidLoad() {
        // Add onViewDidLoad implementation
        let forecastsVC = ForecastsWireframe().module(withDelegate: self)
        view?.add(childViewController: forecastsVC)
    }

    func onDismiss() {
        guard let vc = view else { return }
        wireframe.dismiss(vc)
    }
    
    func onSearch(withText text: String) {
        guard let vc = view as? HomeViewController,
              let forecastsVc = vc.getChildViewController(ForecastsViewController.typeName) as? ForecastsViewController else { return }
        forecastsVc.dataProvider?.forecasts = []
        forecastsVc.updateUI()
        interactor.retrieveForecasts(forCity: text, days: 5)
    }
}

// MARK: - HomeInteractorOutput
extension HomePresenter: HomeInteractorOutput {
    // Add HomeInteractorOutput implementation
    func onForecastsReceived(_ forecasts: [ForecastDescriptor]) {
        guard let vc = view as? HomeViewController,
              let forecastsVc = vc.getChildViewController(ForecastsViewController.typeName) as? ForecastsViewController else { return }
        forecastsVc.dataProvider?.forecasts = forecasts
        forecastsVc.updateUI()
    }
    
    func onError() {
        view?.dataLoaded(false)
    }
}

// MARK: - ForecastsDelegate
extension HomePresenter: ForecastsDelegate {
    func onDescriptorSelected(_ descriptor: ForecastDescriptor) {
        let forecastsDetailsVC = ForecastsDetailsWireframe().module()
        forecastsDetailsVC.dataProvider?.forecastDetials = descriptor.forecasts
        self.view?.push(viewController: forecastsDetailsVC)
    }
}
