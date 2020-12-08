//
//  ForecastsViewController.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit

class ForecastsViewController: UIViewController {
    
    // MARK: - Outlets
    // Place here possible IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    var eventHandler: ForecastsEventHandler?
    var dataProvider: ForecastsDataProvider?
    
    // MARK: - UI Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.eventHandler?.onViewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Internal Utils
    fileprivate func setupUI() {
        // setup UI elements here
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .clear
        tableView.tableFooterView = UIView()
        
        tableView.register(ForecastTVHeaderFooterView.nib,
                           forHeaderFooterViewReuseIdentifier: ForecastTVHeaderFooterView.identifier)
    }
    
    // MARK: - Actions
    // Place here possible IBActions
    
}

extension ForecastsViewController: ForecastsViewProtocol {
    
    func updateUI() {
        // update UI elements here
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate UITableViewDataSource
extension ForecastsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider?.forecasts.count ?? 0 - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupPropertyCellAt(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ForecastTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ForecastTVHeaderFooterView.identifier) as? ForecastTVHeaderFooterView,
                  let firstItem = dataProvider?.forecasts.first else {
                return nil
            }
            let forecastCellItem = ForecastCellItem(withForecast: firstItem)
            header.update(withItem: forecastCellItem)
            return header
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return dataProvider?.forecasts.isEmpty ?? true ? 0.0 : ForecastTVHeaderFooterView.height
    }
    
    // MARK: - Table View Internal Utils
    private func setupPropertyCellAt(_ indexPath: IndexPath) -> UITableViewCell {
        guard let forecastTVC = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier,
                                                              for: indexPath) as? ForecastTableViewCell,
              let forecast = dataProvider?.forecasts[indexPath.row] else {
            return UITableViewCell()
        }
        let forecastCellItem = ForecastCellItem(withForecast: forecast)
        forecastTVC.update(withItem: forecastCellItem)
        
        return forecastTVC
    }
}
