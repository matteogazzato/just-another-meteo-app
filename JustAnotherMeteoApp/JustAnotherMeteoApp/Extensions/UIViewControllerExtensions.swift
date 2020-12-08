//
//  UIViewControllerExtensions.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var typeName: String {
        return String(describing: type(of: self))
    }
    
    static var typeName: String {
        return String(describing: self)
    }

    internal func getChildViewController(_ type: String) -> UIViewController? {
        return self.children.first { $0.typeName == type }
    }
}
