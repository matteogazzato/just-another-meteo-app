//
//  ForecastsDetailsTableViewCell.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 10/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit
import Kingfisher

class ForecastsDetailsTableViewCell: UITableViewCell {
    
    static let height: CGFloat = 200.0
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var primaryLabel: UILabel!
    @IBOutlet private weak var secondaryLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    // MARK: - Internal Utils
    private func setupUI() {
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        containerView.layer.cornerRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// MARK: - External Utils
extension ForecastsDetailsTableViewCell {
    func update(withItem item: ForecastsDetailsCellItem) {
        primaryLabel.text = item.primaryLabelText
        iconImageView.kf.setImage(with: item.iconUrl)
        secondaryLabel.text = item.secondaryLabelText
    }
}

