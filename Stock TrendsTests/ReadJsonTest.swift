//
//  ReadJsonTest.swift
//  Stock TrendsTests
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import XCTest
@testable import Stock_Trends

class ReadJsonTest: XCTestCase {

    func testShouldReadGainerList() throws {
        let gainerList = try ReadJsonUtils.shared.loadDataFromFile(named: "gainer",
                                                                   ofType: ".json",
                                                                   typeClass: MostGainerList.self)

        XCTAssertNotNil(gainerList)
        XCTAssertEqual(gainerList.mostGainerStock.count, 10)
    }

    func testShouldReadLosersList() throws {
        let loserList = try ReadJsonUtils.shared.loadDataFromFile(named: "losers",
                                                                  ofType: ".json",
                                                                  typeClass: MostLoserList.self)

        XCTAssertNotNil(loserList)
        XCTAssertEqual(loserList.mostLoserStock.count, 10)
    }

}
