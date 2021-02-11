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
        Button(action: {
            action()
        }, label: {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)

                Text("Scan to unlock")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
        })
        .background(Color.accentColor)
        .clipShape(Capsule())
        .padding()
    }
}
