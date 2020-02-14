//
//  StockListViewModel.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import Foundation

class StockListViewModel: ObservableObject {

    @Published var loading = false
    @Published var listStock: [Stock] = []

    private var service: ServiceProtocol

    init(service: ServiceProtocol = Service.shared) {
        self.service = service
    }
}

extension StockListViewModel {

    func setupController() {
        self.loading = true
    }

    func loadGainers() {
        self.loading = true
        self.service.fetchGainerList { [weak self] (result) in
            DispatchQueue.main.async {
                self?.loading = false
                switch result {
                case .success(let stocks):
                    self?.listStock = stocks.mostGainerStock
                case .failure(let error):
                    break
                }
            }

        }
    }

    func loadLosers() {
        self.loading = true
        self.service.fetchLoserList { [weak self] (result) in
            DispatchQueue.main.async {
                self?.loading = false
                switch result {
                case .success(let stocks):
                    self?.listStock = stocks.mostLoserStock
                case .failure(let error):
                    break
                }
            }
        }
    }
}
