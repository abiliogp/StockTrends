//
//  ListStock.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import Foundation

struct MostGainerList: Codable {
    var mostGainerStock: [Stock]

    enum CodingKeys: String, CodingKey {
        case mostGainerStock
    }
}
