//
//  Environment.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import Foundation

enum Environment {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    static let endpointGainers: String = {
        guard let endpoint = Environment.infoDictionary[Keys.Endpoints.gainers] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return endpoint
    }()

    static let endpointLosers: String = {
        guard let endpoint = Environment.infoDictionary[Keys.Endpoints.losers] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return endpoint
    }()

    static let imagePath: String = {
        guard let endpoint = Environment.infoDictionary[Keys.Endpoints.imagePath] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return endpoint
    }()
}
