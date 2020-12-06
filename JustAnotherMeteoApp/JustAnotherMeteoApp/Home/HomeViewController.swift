//
//  HomeViewController.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 06/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    // Place here possible IBOutlets

    var eventHandler: HomeEventHandler?
    var dataProvider: HomeDataProvider?

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
    }

    // MARK: - Actions
    // Place here possible IBActions
    @IBAction func search(_ sender: Any) {
        eventHandler?.onSearch()
    }
}

extension HomeViewController: HomeViewProtocol {
    func updateUI() {
        // update UI elements here
    }
}
