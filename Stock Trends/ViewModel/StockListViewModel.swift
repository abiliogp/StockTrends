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
}
