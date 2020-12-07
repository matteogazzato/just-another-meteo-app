//
//  NetworkClient.swift
//  JustAnotherMeteoApp
//
//  Created Matteo Gazzato on 06/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Alamofire
import RxSwift

class NetworkClient {
    static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        //Create an RxSwift observable, which will be the one to call the request when subscribed to
        return Observable<T>.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            let request = AF.request(urlConvertible).responseDecodable(of: T.self) { response in
                switch response.result {
                    case .success(let value):
                        //Everything is fine, return the value in onNext
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        NSLog(error.localizedDescription)
                        //Something went wrong, switch on the status code and return the error
                        switch response.response?.statusCode {
                        case 400:
                            NSLog("Server status code 400 BAD REQUEST")
                            observer.onError(APIError.forbidden)
                        case 403:
                            NSLog("Server status code 403 FORBIDDEN")
                            observer.onError(APIError.forbidden)
                        case 404:
                            NSLog("Server status code 404 NOT FOUND")
                            observer.onError(APIError.notFound)
                        case 409:
                            NSLog("Server status code 409 CONFLICT")
                            observer.onError(APIError.conflict)
                        case 500:
                            NSLog("Server status code 500 INTERNAL SERVER ERROR")
                            observer.onError(APIError.internalServerError)
                        default:
                            NSLog("Server status code \(response.response?.statusCode ?? 0)")
                            observer.onError(APIError.unknown)
                        }
                }
            }
            
            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
