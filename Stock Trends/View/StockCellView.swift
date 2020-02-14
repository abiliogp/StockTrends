//
//  StockCellView.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 13/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import SwiftUI

struct StockCellView: View {

    var ticker: String
    var companyName: String

    var price: String
    var change: Double
    var changesPercentage: String

    var body: some View {
        HStack {
            VStack {
                Text("Ticker: \(ticker)")
                    .bold()
                    .font(.callout)
                    .lineLimit(1)
                    .truncationMode(.tail)

                Text(companyName)
                    .bold()
                    .font(.callout)
                    .lineLimit(1)
                    .truncationMode(.tail)

            }
            VStack {
                ChangeView(change: change,
                           changePercentage: changesPercentage)

                PriceView(price: (price as NSString).doubleValue)

            }
        }.aspectRatio(contentMode: .fill)
    }
}

struct ChangeView: View {
    var change = 0.0
    var changePercentage: String

    var body: some View {
        Group {
            if change < 0 {
                TextChange(changePercentage: changePercentage,
                           color: Color.red)
            } else if change < 5 {
                TextChange(changePercentage: changePercentage,
                           color: Color.orange)
            } else if change < 15 {
                TextChange(changePercentage: changePercentage,
                           color: Color.yellow)
            } else {
                TextChange(changePercentage: changePercentage,
                           color: Color.green)
            }
        }
    }
}

struct TextChange: View {
    var changePercentage: String
    var color: Color

    var body: some View {
        Text(changePercentage)
            .font(.subheadline)
            .foregroundColor(.secondary)
            .background(color, alignment: .leading)
            .cornerRadius(4)
            .padding(4)
    }
}

struct PriceView: View {
    var price = 0.0

    var body: some View {
        Group {
            if price > 500 {
                TextPrice(price: price,
                          color: Color.red)
            } else if price > 200 {
                TextPrice(price: price,
                          color: Color.orange)
            } else if price > 50 {
                TextPrice(price: price,
                          color: Color.yellow)
            } else {
                TextPrice(price: price,
                          color: Color.green)
            }
        }
    }
}

struct TextPrice: View {
    var price: Double
    var color: Color

    var body: some View {
        Text("Price: $ \(price, specifier: "%.2f")")
            .font(.subheadline)
            .multilineTextAlignment(.trailing)
            .foregroundColor(.secondary)
            .background(color, alignment: .center)
            .cornerRadius(4)
            .padding(4)
    }
}

struct StockCellView_Previews: PreviewProvider {

    // Gainer
    //    "ticker" : "SAM",
    //    "changes" : 25.83,
    //    "price" : "399.69",
    //    "changesPercentage" : "(+6.91%)",
    //    "companyName" : "Boston Beer Company Inc. (The)"

    // Loser
    //    "ticker" : "EPCP.PA",
    //    "changes" : -14.0,
    //    "price" : "795",
    //    "changesPercentage" : "(-1.73%)",
    //    "companyName" : "EPC Groupe"

    static var previews: some View {
        StockCellView(
            ticker: "SAM",
            companyName: "Boston Beer Company Inc. (The)",
            price: "399.69",
            change: 25.83,
            changesPercentage: "(+6.91%)")
    }
}
