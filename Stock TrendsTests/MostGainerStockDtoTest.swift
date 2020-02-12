//
//  MostGainerStockDtoTest.swift
//  Stock TrendsTests
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import XCTest
@testable import StockTrends

class ConvertDtoTest: XCTestCase {

    func testShouldReadGainerList() {
        let testBundle = Bundle(for: type(of: self))
        let jsonFileUrl = testBundle.path(forResource: "gainer", ofType: ".json")
        let data = try Data(contentsOf: jsonFileUrl)
        let gainerList = try JSONDecoder.decode()
        
    }

}
