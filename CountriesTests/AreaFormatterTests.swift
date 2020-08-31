
//
//  AreaFormatterTests.swift
//  CountriesTests
//
//  Created by Charles Vu on 31/08/2020.
//  Copyright © 2020 James Weatherley. All rights reserved.
//

import Foundation
import XCTest
@testable import Countries

class AreaFormatterTests: XCTestCase {
    let britishLocale = Locale(identifier: "EN-GB")
    let frenchLocale = Locale(identifier: "FR-FR")
    
    
    // British Locale Tests, "," is the thousand separator
    func test_AreaFormatter_1_NoComma_InUKLocale() {
        let result = AreaFormatter.formatArea(area: 1,
                                              locale: britishLocale)
        XCTAssertEqual(result, "1 km²", "1 km squared should be formatted as 1 km²")
    }
    
    func test_AreaFormatter_42_NoComma_InUKLocale() {
        let result = AreaFormatter.formatArea(area: 42,                                                                   locale: britishLocale)
        XCTAssertEqual(result, "42 km²", "Any number < 999 should not be formated")
    }
    
    func test_AreaFormatter_1000_formatHasOneComma_InUKLocale() {
        let result = AreaFormatter.formatArea(area: 1000,
                                              locale: britishLocale)
        XCTAssertEqual(result, "1,000 km²", "1000 should be formatted as 1,000")
    }
    
    func test_AreaFormatter_100000_formatHasOneComma_InUKLocale() {
        let result = AreaFormatter.formatArea(area: 100000,
                                              locale: britishLocale)
        XCTAssertEqual(result, "100,000 km²", "100000 should be formatted as 100,000")
    }
    
    func test_AreaFormatter_1000000_formatHasTwoComma_InUKLocale() {
        let result = AreaFormatter.formatArea(area: 1000000,
                                              locale: britishLocale)
        XCTAssertEqual(result, "1,000,000 km²", "1000000 should be formatted as 1,000,000 km²")
    }
    
    /*
     French locale tests
     Note that in France, they are separating their thousand with Non Breaking Spaces (NBSP) and not spaces
     */
    func test_AreaFormatter_1_NoNBSP_InFrenchLocale() {
        let result = AreaFormatter.formatArea(area: 1,
                                              locale: frenchLocale)
        XCTAssertEqual(result, "1 km²", "1 km squared should be formatted as 1 km²")
    }
    
    func test_AreaFormatter_1000_formatHasOneNBSP_InFrenchLocale() {
        let result = AreaFormatter.formatArea(area: 1000,
                                              locale: frenchLocale)
        XCTAssertEqual(result, "1 000 km²", "1000 km squared should be formatted as 1 000 km²")
    }
    
    func test_AreaFormatter_100000_formatHasOneNBSP_InFrenchLocale() {
        let result = AreaFormatter.formatArea(area: 100000,
                                              locale: frenchLocale)
        XCTAssertEqual(result, "100 000 km²", "100000 km squaredshould be formatted as 100 000 km²")
    }
    
    func test_AreaFormatter_1000000_formatHasTwoNBSP_InFrenchLocale() {
        let result = AreaFormatter.formatArea(area: 1000000,
                                              locale: frenchLocale)
        XCTAssertEqual(result, "1 000 000 km²", "1000000 km squared should be formatted as 1 000 000 km²")
    }
}
