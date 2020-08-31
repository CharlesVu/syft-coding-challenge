//
//  CountryListViewControllerTest.swift
//  CountriesTests
//
//  Created by Charles Vu on 31/08/2020.
//  Copyright © 2020 James Weatherley. All rights reserved.
//

import Foundation
import XCTest
@testable import Countries

class CountryListViewControllerTests: XCTestCase {
    var sut = CountryListViewController.self
    var mockCell: MockCountryCell!

    override func setUp() {
        mockCell = MockCountryCell()
    }

    func test_CountryListViewController_hideCapitalIfNoneExist() {
        sut.layoutCell(mockCell, capital: nil)

        XCTAssertEqual(1, mockCell.hideCount, "Having an nil capital should call hideCapitalLabels once")
        XCTAssertEqual(0, mockCell.showCount, "Having an nil capital should not call showCapitalLabels")

    }

    func test_CountryListViewController_hideCapitalIfEmptyCapital() {
         sut.layoutCell(mockCell, capital: "")

         XCTAssertEqual(1, mockCell.hideCount, "Having an empty capital should call hideCapitalLabels once")
        XCTAssertEqual(0, mockCell.showCount, "Having an empty capital should not call showCapitalLabels")

     }

    func test_CountryListViewController_showCapitalIfOneExist() {
         sut.layoutCell(mockCell, capital: "test")

         XCTAssertEqual(1, mockCell.showCount, "Having an empty capital should call showCapitalLabels once")
        XCTAssertEqual(0, mockCell.hideCount, "Having an empty capital should not call hideCapitalLabels")

     }
}
