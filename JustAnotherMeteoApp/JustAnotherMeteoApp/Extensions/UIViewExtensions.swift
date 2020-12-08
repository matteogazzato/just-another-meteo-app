//
//  UIViewExtensions.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import UIKit

extension UIView {
    func fillSuperview() {
        var margins: UILayoutGuide!
        let superview = self.superview!
        if #available(iOS 11.0, *) {
            margins = superview.safeAreaLayoutGuide
        } else {
            margins = superview.layoutMarginsGuide
        }
        
        self.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
}

