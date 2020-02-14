//
//  ActivityIndicator.swift
//  Stock Trends
//
//  Created by Abilio Gambim Parada on 13/02/2020.
//  Copyright © 2020 Abilio Gambim Parada. All rights reserved.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    typealias UIView = UIActivityIndicatorView

    fileprivate var configuration = { (indicator: UIView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView {
        UIView()
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        uiView.startAnimating()
        configuration(uiView)
    }
}
