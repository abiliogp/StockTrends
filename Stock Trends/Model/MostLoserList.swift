//
//  MostLoserList.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import Foundation

class MostLoserList: Codable {
    var mostLoserStock: [Stock]

    enum CodingKeys: String, CodingKey {
        case mostLoserStock
    }
}
