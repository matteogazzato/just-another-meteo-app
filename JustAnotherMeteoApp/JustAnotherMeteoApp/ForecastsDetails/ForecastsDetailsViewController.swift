//
//  ForecastsDetailsViewController.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 09/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit

class ForecastsDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    // Place here possible IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var eventHandler: ForecastsDetailsEventHandler?
    var dataProvider: ForecastsDetailsDataProvider?

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
	}
    
    // MARK: - Actions
    // Place here possible IBActions
}

extension ForecastsDetailsViewController: ForecastsDetailsViewProtocol {
	
    func updateUI() {
        // update UI elements here
        
    }
}

// MARK: - UITableViewDelegate UITableViewDataSource
extension ForecastsDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider?.forecastDetials.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupPropertyCellAt(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ForecastTableViewCell.height
    }
            
    // MARK: - Table View Internal Utils
    private func setupPropertyCellAt(_ indexPath: IndexPath) -> UITableViewCell {
        guard let forecastTVC = tableView.dequeueReusableCell(withIdentifier: ForecastsDetailsTableViewCell.identifier,
                                                              for: indexPath) as? ForecastsDetailsTableViewCell,
              let forecast = dataProvider?.forecastDetials[indexPath.row] else {
            return UITableViewCell()
        }
        let forecastCellItem = ForecastsDetailsCellItem(withForecast: forecast)
        forecastTVC.update(withItem: forecastCellItem)
        
        return forecastTVC
    }
}
