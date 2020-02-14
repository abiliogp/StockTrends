//
//  ImageView.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 14/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageView: View {

    @ObservedObject var imageLoader: ImageLoader

    init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }

    var body: some View {
        Group {
            if imageLoader.data != nil {
                Image(uiImage: UIImage(data: imageLoader.data!) ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ActivityIndicator()
            }
        }
    }
}
