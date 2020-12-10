//
//  ForecastTVHeaderFooterView.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit

class ForecastTVHeaderFooterView: UITableViewHeaderFooterView {
    
    static let height: CGFloat = 200.0
    
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
            
}

// MARK: - External utils
extension ForecastTVHeaderFooterView {
    func update(withItem item: ForecastCellItem) {
        mainLabel.text = item.mainLabelText
        iconImageView.kf.setImage(with: item.iconUrl)
    }
}
