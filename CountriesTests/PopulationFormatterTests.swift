//
//  PopulationFormatterTests.swift
//  CountriesTests
//
//  Created by Charles Vu on 29/08/2020.
//  Copyright © 2020 James Weatherley. All rights reserved.
//

import Foundation
import XCTest
@testable import Countries

class PopulationFormatterTests: XCTestCase {
    let britishLocale = Locale(identifier: "EN-GB")
    let frenchLocale = Locale(identifier: "FR-FR")


    // British Locale Tests, "," is the thousand separator
    func test_PopulationFormatter_1_NoComma_InUKLocale() {
        let result = PopulationFormatter.formatPopulation(population: 1,
                                                          locale: britishLocale)
        XCTAssertEqual(result, "1", "Any number < 999 should not be formated")
    }

    func test_PopulationFormatter_42_NoComma_InUKLocale() {
        let result = PopulationFormatter.formatPopulation(population: 42,                                                                   locale: britishLocale)
        XCTAssertEqual(result, "42", "Any number < 999 should not be formated")
    }

    func test_PopulationFormatter_1000_formatHasOneComma_InUKLocale() {
        let result = PopulationFormatter.formatPopulation(population: 1000,
                                                          locale: britishLocale)
        XCTAssertEqual(result, "1,000", "1000 should be formatted as 1,000")
    }

    func test_PopulationFormatter_100000_formatHasOneComma_InUKLocale() {
        let result = PopulationFormatter.formatPopulation(population: 100000,
                                                          locale: britishLocale)
        XCTAssertEqual(result, "100,000", "100000 should be formatted as 100,000")
    }

    func test_PopulationFormatter_1000000_formatHasTwoComma_InUKLocale() {
        let result = PopulationFormatter.formatPopulation(population: 1000000,
                                                          locale: britishLocale)
        XCTAssertEqual(result, "1,000,000", "1000000 should be formatted as 1,000,000")
    }

    /*
     French locale tests
     Note that in France, they are separating their thousand with Non Breaking Spaces (NBSP) and not spaces
     */
    func test_PopulationFormatter_1_NoNBSP_InFrenchLocale() {
        let result = PopulationFormatter.formatPopulation(population: 1,
                                                          locale: frenchLocale)
        XCTAssertEqual(result, "1", "Any number < 999 should not be formated")
    }

    func test_PopulationFormatter_42_NoNBSP_InFrenchLocale() {
        let result = PopulationFormatter.formatPopulation(population: 42,                                                                   locale: frenchLocale)
        XCTAssertEqual(result, "42", "Any number < 999 should not be formated")
    }

    func test_PopulationFormatter_1000_formatHasOneNBSP_InFrenchLocale() {
        let result = PopulationFormatter.formatPopulation(population: 1000,
                                                          locale: frenchLocale)
        XCTAssertEqual(result, "1 000", "1000 should be formatted as 1 000")
    }

    func test_PopulationFormatter_100000_formatHasOneNBSP_InFrenchLocale() {
        let result = PopulationFormatter.formatPopulation(population: 100000,
                                                          locale: frenchLocale)
        XCTAssertEqual(result, "100 000", "100000 should be formatted as 100 000")
    }

    func test_PopulationFormatter_1000000_formatHasTwoNBSP_InFrenchLocale() {
        let result = PopulationFormatter.formatPopulation(population: 1000000,
                                                          locale: frenchLocale)
        XCTAssertEqual(result, "1 000 000", "1000000 should be formatted as 1 000 000")
    }
}
