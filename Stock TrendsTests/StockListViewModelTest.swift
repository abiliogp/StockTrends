//
//  StockListViewModelTest.swift
//  Stock TrendsTests
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import XCTest
import Combine
@testable import Stock_Trends

class StockListViewModelTest: XCTestCase {

    var viewModel = StockListViewModel()

    func testShouldPresentLoading() {
        let expect = XCTestExpectation()
        expect.expectedFulfillmentCount = 2

        var loadingsSignal = [Bool]()

        let sink = Subscribers.Sink<Bool, Never>(
            receiveCompletion: { _ in },
            receiveValue: {
                loadingsSignal.append($0)
                expect.fulfill()
        })

        viewModel.$loading.subscribe(sink)

        viewModel.setupController()

        wait(for: [expect], timeout: 1.0)

        XCTAssertFalse(loadingsSignal.first!)
        XCTAssertTrue(loadingsSignal.last!)
        XCTAssertEqual(loadingsSignal.count, 2)
    }

    func testShouldShowMostLoserWhenFetch() {

    }

    func testShouldShowErrorWhenError() {

    }
}
