//
//  ImageLoader.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 14/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import Foundation

class ImageLoader: ObservableObject {

    @Published var data: Data?

    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
