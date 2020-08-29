//
//  PopulationFormatter.swift
//  Countries
//
//  Created by Charles Vu on 29/08/2020.
//  Copyright © 2020 Charles Vu. All rights reserved.
//

import Foundation

struct PopulationFormatter {
    static func formatPopulation(population: Int32,
                                 locale: Locale = Locale.current) -> String {
        let formater = NumberFormatter()
        formater.numberStyle = .decimal
        formater.locale = locale
        guard let result = formater.string(for: population) else {
            assertionFailure("Invalid argument for population")
            return "0"
        }
        return result
    }
}
