//
//  Helpers.swift
//  JustAnotherMeteoApp
//
//  Created by Matteo Gazzato on 08/12/2020.
//  Copyright © 2020 matteogazzato@gmail.com. All rights reserved.
//

import Foundation

class Helpers {
    static func convert(dateString date: String,
                        withFormat initialFormat: String,
                        toFormat finalFormat: String) -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = initialFormat

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = finalFormat
        var convertedDate: String?
        if let finalDate = dateFormatterGet.date(from: date) {
            convertedDate = dateFormatterPrint.string(from: finalDate)
        }
        return convertedDate
    }
}
