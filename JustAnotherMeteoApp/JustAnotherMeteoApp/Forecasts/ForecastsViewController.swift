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
        self.view.isHidden = true
    }
    
    // MARK: - Actions
    // Place here possible IBActions
    
}

extension ForecastsViewController: ForecastsViewProtocol {
    
    func updateUI() {
        // update UI elements here
        tableView.reloadData()
        self.view.isHidden = dataProvider?.forecasts.isEmpty ?? true ? true : false
    }
}

// MARK: - UITableViewDelegate UITableViewDataSource
extension ForecastsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider?.forecasts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupPropertyCellAt(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ForecastTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        eventHandler?.onItemSelected(atIndex: indexPath.row)
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
