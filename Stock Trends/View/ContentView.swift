//
//  ContentView.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 12/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = StockListViewModel()

    init() {
        viewModel.setupController()
        viewModel.loadGainers()
    }

    var body: some View {
        NavigationView {
            Group {
                if viewModel.loading {
                    ActivityIndicator()
                } else {
                    List {
                        ForEach(viewModel.listStock) { stockItem in
                            StockCellView(
                                ticker: stockItem.ticker,
                                companyName: stockItem.companyName,
                                price: stockItem.price,
                                change: stockItem.changes,
                                changesPercentage:
                                stockItem.changesPercentage)
                        }
                    }
                }
            }
            .navigationBarTitle("Stock")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.viewModel.loadLosers()
                    }) {
                         Text("Losers")
                    }
                }
            )
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
