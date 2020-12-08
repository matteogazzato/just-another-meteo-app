//
//  ForecastTableViewCell.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    static let height: CGFloat = 100.0
    
    // MARK: - Outlets
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var secondaryLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Internal Utils
    private func setupUI() {

    }
}

// MARK: - External Utils
extension ForecastTableViewCell {
    func update(withItem item: ForecastCellItem) {
        mainLabel.text = item.mainLabelText
        secondaryLabel.text = item.secondaryLabelText
    }
}
