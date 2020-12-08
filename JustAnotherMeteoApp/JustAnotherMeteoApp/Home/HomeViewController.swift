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
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
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
        searchBar.delegate = self
    }

    // MARK: - Actions
    // Place here possible IBActions
    
}

extension HomeViewController: HomeViewProtocol {
    func updateUI() {
        // update UI elements here
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        eventHandler?.onSearch(withText: text)
    }
}
