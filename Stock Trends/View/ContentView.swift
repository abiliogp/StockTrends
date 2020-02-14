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

    @State private var isGainer = true

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

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top,
                                   spacing: ViewProperties.spacing) {
                                    ForEach(viewModel.listStock) { stockItem in
                                        HorizontalCellView(ticker: stockItem.ticker)
                                    }
                            }.padding(
                                .horizontal,
                                ViewProperties.padding)
                        }.padding(.horizontal,
                                  ViewProperties.paddingNegative)

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
                        if self.isGainer {
                            self.viewModel.loadLosers()
                        } else {
                            self.viewModel.loadGainers()
                        }
                        self.isGainer.toggle()

                    }, label: {
                        Group {
                            if isGainer {
                                Image("arrow.down.circle.fill")
                            } else {
                                Image("arrow.up.circle.fill")
                            }
                        }
                    })
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
