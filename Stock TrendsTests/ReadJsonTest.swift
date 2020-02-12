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

        let gainerList = try loadDataFromFile(named: "gainer",
                                              ofType: ".json",
                                              typeClass: MostGainerList.self)

        XCTAssertNotNil(gainerList)
        XCTAssertEqual(gainerList.mostGainerStock.count, 10)
    }

    func testShouldReadLosersList() throws {

        let loserList = try loadDataFromFile(named: "losers",
                                             ofType: ".json",
                                             typeClass: MostLoserList.self)

        XCTAssertNotNil(loserList)
        XCTAssertEqual(loserList.mostLoserStock.count, 10)
    }

}

extension ReadJsonTest {
    private func loadDataFromFile<T>(named: String,
                                     ofType: String,
                                     typeClass: T.Type) throws -> T where T: Decodable {

        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: named, ofType: ofType)
        let data = try Data(contentsOf: URL(fileURLWithPath: path!))
        let dto = try JSONDecoder().decode(T.self, from: data)
        return dto
    }
}
