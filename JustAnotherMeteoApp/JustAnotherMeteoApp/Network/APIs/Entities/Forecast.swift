//
//  Forecast.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 07/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

struct Forecast: Codable {
    let temperature: Float
    let humidity: Int
    let weather: Weather?
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case temperature = "temp"
        case humidity = "humidity"
        case weather = "weather"
    }
    
    // MARK: - Decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let main = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .main)
        temperature = try main.decode(Float.self, forKey: .temperature)
        humidity = try main.decode(Int.self, forKey: .humidity)
        let weathers = try container.decode([Weather].self, forKey: .weather)
        weather = weathers.first
    }
    
    // MARK: - Encoding
    func encode(to encoder: Encoder) throws {
        // TODO: in the next release 😉
    }
}
