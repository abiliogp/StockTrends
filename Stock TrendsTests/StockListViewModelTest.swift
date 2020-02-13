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

    func testShouldPresentLoading() {
        let viewModel = StockListViewModel()

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
        //Given
        let viewModel = StockListViewModel()

        let expectLoad = XCTestExpectation()
        expectLoad.expectedFulfillmentCount = 4

        let expectStockList = XCTestExpectation()
        expectStockList.expectedFulfillmentCount = 2

        var loadingsSignal = [Bool]()
        var stockList = [[Stock]]()

        let sinkLoad = Subscribers.Sink<Bool, Never>(
            receiveCompletion: { _ in },
            receiveValue: {
                loadingsSignal.append($0)
                expectLoad.fulfill()
        })

        let sinkStockList = Subscribers.Sink<[Stock], Never>(
            receiveCompletion: { _ in },
            receiveValue: {
                stockList.append($0)
                expectStockList.fulfill()
        })

        viewModel.$loading.subscribe(sinkLoad)
        viewModel.$listStock.subscribe(sinkStockList)

        //When
        viewModel.setupController()
        viewModel.loadGainers()

        wait(for: [expectLoad, expectStockList], timeout: 5.0)

        //Assert
        XCTAssertFalse(loadingsSignal[0])
        XCTAssertTrue(loadingsSignal[1])
        XCTAssertTrue(loadingsSignal[2])
        XCTAssertFalse(loadingsSignal[3])

        XCTAssertEqual(loadingsSignal.count, 4)

        XCTAssertEqual(stockList.first?.count, 0)
        XCTAssertEqual(stockList.last?.count, 10)
        XCTAssertEqual(stockList.count, 2)
    }

    func testShouldShowErrorWhenError() {

    }
}
