//
//  AreaFormatter.swift
//  Countries
//
//  Created by Charles Vu on 31/08/2020.
//  Copyright © 2020 James Weatherley. All rights reserved.
//

import Foundation

struct AreaFormatter {
    static func formatArea(area: Float,
                           locale: Locale = Locale.current) -> String {
        let formater = NumberFormatter()
        formater.numberStyle = .decimal
        formater.locale = locale
        guard let result = formater.string(for: area) else {
            assertionFailure("Invalid argument for population")
            return "0"
        }
        return result + " km²"
    }
}
