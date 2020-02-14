//
//  Stock.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import Foundation

struct Stock: Codable {
    var ticker: String
    var changes: Double
    var price: String
    var changesPercentage: String
    var companyName: String

    enum CodingKeys: String, CodingKey {
        case ticker,
        changes,
        price,
        changesPercentage,
        companyName
    }
}
