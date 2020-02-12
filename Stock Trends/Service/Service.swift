//
//  Service.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func fetchGainerList(completionHandler: @escaping (Result<MostGainerList, ServiceError>) -> Void)
    func fetchLoserList(completionHandler: @escaping (Result<MostLoserList, ServiceError>) -> Void)
}

enum ServiceError: Error {
    case unavailable
    case decodeError
}

struct Service {

    static let shared = Service()

    private init() {
    }
}

extension Service: ServiceProtocol {
    func fetchGainerList(completionHandler: @escaping (Result<MostGainerList, ServiceError>) -> Void) {
        fetch(from: Environment.endpointGainers) { (result) in
            completionHandler(result)
        }
    }

    func fetchLoserList(completionHandler: @escaping (Result<MostLoserList, ServiceError>) -> Void) {
        fetch(from: Environment.endpointLosers) { (result) in
            completionHandler(result)
        }
    }
}

extension Service {
    private func fetch<T>(from: String,
                          completionHandler: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {

        guard let url = URL(string: from) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decoded))
                } catch {
                    completionHandler(.failure(.decodeError))
                }
            } else {
                completionHandler(.failure(.unavailable))
            }
        }.resume()
    }
}
