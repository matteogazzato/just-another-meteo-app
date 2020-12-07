//
//  FiveDaysForecastResponse.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 07/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

struct FiveDaysForecastResponse: Codable {
    let city: City
    let forecasts: [Forecast]
    
    enum CodingKeys: String, CodingKey {
        case forecasts = "list"
        case city = "city"
    }
    
    // MARK: - Decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        forecasts = try container.decode([Forecast].self, forKey: .forecasts)
        city = try container.decode(City.self, forKey: .city)
    }
    
    // MARK: - Encoding
    func encode(to encoder: Encoder) throws {
        // TODO: in the next release 😉
    }
}


