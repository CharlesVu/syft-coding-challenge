//
//  MockCountryCell.swift
//  CountriesTests
//
//  Created by Charles Vu on 31/08/2020.
//  Copyright © 2020 James Weatherley. All rights reserved.
//

import Foundation
@testable import Countries

class MockCountryCell: CapitalLabelHideable {
    var hideCount = 0
    var showCount = 0

    func showCapitalLabels() {
        showCount += 1
    }

    func hideCapitalLabels() {
        hideCount += 1
    }
}
