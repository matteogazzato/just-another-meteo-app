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
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    
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
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - Internal Utils
    fileprivate func setupUI() {
        // setup UI elements here
        searchBar.delegate = self
        activityIndicator.isHidden = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }

    // MARK: - Actions
    // Place here possible IBActions
    
}

extension HomeViewController: HomeViewProtocol {
    func updateUI() {
        // update UI elements here
        containerView.clipsToBounds = true
    }
    
    func add(childViewController vc: UIViewController) {
        addChild(vc)
        vc.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        vc.view.frame = containerView.bounds
        containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    func push(viewController vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func dataLoaded(_ loaded: Bool) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        if !loaded {
            let alert = UIAlertController(title: "Warning",
                                          message: "An error occurred, please try again",
                                          preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        view.endEditing(true)
        eventHandler?.onSearch(withText: text)
    }
}
