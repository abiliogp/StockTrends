//
//  HorizontalCellView.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 14/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import SwiftUI

struct HorizontalCellView: View {

    var ticker: String
    private var url: String

    init(ticker: String) {
        self.ticker = ticker
        let imageNamed = ticker.lowercased()
        self.url = "\(Environment.imagePath)/\(imageNamed).png"
    }

    var body: some View {
        VStack {
            ImageView(withURL: url)
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                .frame(width: ViewProperties.width150,
                       height: ViewProperties.height150,
                       alignment: .center)

            Text(ticker)
                .bold()
                .font(.callout)
                .lineLimit(1)
                .frame(width: ViewProperties.width120,
                       height: ViewProperties.height20,
                       alignment: .center)
                .truncationMode(.tail)

        }.padding(ViewProperties.padding10)
            .background(Color(ViewProperties.grayLight))
            .cornerRadius(ViewProperties.cornerRadius, antialiased: true)
    }
}

struct HorizontalCellView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCellView(ticker: "BH-A")
    }
}
