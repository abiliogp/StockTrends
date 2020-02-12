//
//  StockListViewModelTest.swift
//  Stock TrendsTests
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import XCTest
@testable import Stock_Trends

class StockListViewModelTest: XCTestCase {

    var viewModel = StockListViewModel()

    func testShouldShowMostGainerWhenFetch() {
        viewModel.setupController()
    }

    func testShouldShowMostLoserWhenFetch() {

    }

    func testShouldShowErrorWhenError() {

    }
}
