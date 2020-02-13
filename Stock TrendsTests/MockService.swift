//
//  MockService.swift
//  Stock TrendsTests
//
//  Created by Abilio Gambim Parada on 13/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import Foundation
@testable import Stock_Trends

class MockService: ServiceProtocol {

    var forceError = false

    func fetchGainerList(completionHandler: @escaping (Result<MostGainerList, ServiceError>) -> Void) {

        do {
            let gainerList = try ReadJsonUtils.shared.loadDataFromFile(named: "gainer",
                                                                       ofType: ".json",
                                                                       typeClass: MostGainerList.self)

            if forceError {
                completionHandler(.failure(.unavailable))
            } else {
                completionHandler(.success(gainerList))
            }
        } catch {
            completionHandler(.failure(.decodeError))
        }
    }

    func fetchLoserList(completionHandler: @escaping (Result<MostLoserList, ServiceError>) -> Void) {
        do {
            let loserList = try ReadJsonUtils.shared.loadDataFromFile(named: "losers",
                                                                      ofType: ".json",
                                                                      typeClass: MostLoserList.self)

            if forceError {
                completionHandler(.failure(.unavailable))
            } else {
                completionHandler(.success(loserList))
            }
        } catch {
            completionHandler(.failure(.decodeError))
        }
    }
}
