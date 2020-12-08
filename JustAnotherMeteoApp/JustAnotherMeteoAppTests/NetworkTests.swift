//
//  NetworkTests.swift
//  JustAnotherMeteoAppTests
//
//  Created by Matteo Gazzato on 07/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import XCTest
@testable import JustAnotherMeteoApp
import RxSwift

class NetworkTests: XCTestCase {
    let disposeBag = DisposeBag()

    func testFiveDaysForecasts() throws {
        let city = "Milan"
        let responseExpectation = expectation(description: "Five days forecast weather received")
        let desc = WeatherAPIClientDescriptor(city: "Milan", days: 5)
        WeatherAPIClient.forecastsWeather(fromDescriptor: desc)
            .subscribe(onNext: { response in
                XCTAssertEqual(response.city.name, city)
                XCTAssertEqual(response.forecasts.count, 5)
                responseExpectation.fulfill()
            }, onError: { error in
                XCTFail()
            })
            .disposed(by: disposeBag)
        wait(for: [responseExpectation], timeout: 10.0)
    }

}
