//
//  APIConfiguration.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 06/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    // MARK: - Optionals
    var parameters: Parameters { get }
}

extension APIConfiguration {
    var parameters: Parameters { return [:] }
}
