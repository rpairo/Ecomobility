//
//  MapScanButton.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 11/2/21.
//

import SwiftUI

struct MapScanButton: View {
    // MARK: Properties
    var action: () -> Void

    // MARK: View
    var body: some View {
        button
    }
}

extension MapScanButton {
    // MARK: Components
    private var button: some View {
        Button(action: {
            action()
        }, label: {
            content
        })
        .background(Color.accentColor)
        .clipShape(Capsule())
        .padding()
    }

    private var content: some View {
        HStack {
            image
            title
        }
        .padding()
    }

    private var image: some View {
        Image(systemName: "magnifyingglass")
            .foregroundColor(.white)
    }

    private var title: some View {
        Text("Scan to unlock")
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}
