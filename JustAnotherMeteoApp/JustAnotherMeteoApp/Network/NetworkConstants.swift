//
//  NetworkConstants.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 06/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Alamofire

struct NetworkConstants {
    static let apiKey = "46e7709dde33fbca31403406d851a356"
    static let baseUrl = "api.openweathermap.org/data/2.5/"
}

//enum HTTPHeaderField: String {
//    case authentication = "Authorization"
//    case contentType = "Content-Type"
//    case acceptType = "Accept"
//    case acceptEncoding = "Accept-Encoding"
//    case tenantId = "tenant-id"
//    case applicationId = "application-id"
//}
//
//enum HTTPHeaderValue: String {
//    case q = "jeniot"
//    case applicationId = "saad"
//}
//
//enum ContentType: String {
//    case json = "Application/json"
//    case formEncode = "application/x-www-form-urlencoded"
//}

enum APIError: Error {
    case badRequest             //Status code 400
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
    case unknown                //Unknown
    case badUrl
}

