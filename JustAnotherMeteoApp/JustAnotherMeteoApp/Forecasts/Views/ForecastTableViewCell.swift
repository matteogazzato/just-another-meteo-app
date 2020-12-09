//
//  ForecastTableViewCell.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit
import Kingfisher

class ForecastTableViewCell: UITableViewCell {
    
    static let height: CGFloat = 150.0
    
    // MARK: - Outlets
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var secondaryLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Internal Utils
    private func setupUI() {
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        containerView.layer.cornerRadius = 5.0
    }
}

// MARK: - External Utils
extension ForecastTableViewCell {
    func update(withItem item: ForecastCellItem) {
        mainLabel.text = item.mainLabelText
        iconImageView.kf.setImage(with: item.iconUrl)
    }
}
