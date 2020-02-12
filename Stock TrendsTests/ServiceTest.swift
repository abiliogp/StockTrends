//
//  ServiceTest.swift
//  Stock TrendsTests
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import XCTest
@testable import Stock_Trends

class ServiceTest: XCTestCase {

    func testShouldReturnMostGainer() {
        let expectFetch = XCTestExpectation()

        Service.shared.fetchGainerList { (result) in
            switch result {
            case .success(let list):
                XCTAssertNotNil(list)
                XCTAssertTrue(list.mostGainerStock.isEmpty == false)
            case .failure(let error):
                XCTAssertNotNil(error)
            }

            expectFetch.fulfill()
        }

        wait(for: [expectFetch], timeout: 1.0)
    }

    func testShouldReturnMostLoser() {
        let expectFetch = XCTestExpectation()

        Service.shared.fetchLoserList { (result) in
            switch result {
            case .success(let list):
                XCTAssertNotNil(list)
                XCTAssertTrue(list.mostLoserStock.isEmpty == false)
            case .failure(let error):
                XCTAssertNotNil(error)
            }

            expectFetch.fulfill()
        }

        wait(for: [expectFetch], timeout: 1.0)
    }

}
