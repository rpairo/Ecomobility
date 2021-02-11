//
//  SocialGoogleButton.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 6/2/21.
//

import SwiftUI

struct SocialGoogleButton: View {
    // MARK: Properties
    var onRequest: () -> Void
    var onResult: () -> Void
    var title: String

    let gradient = LinearGradient(
        gradient: Gradient(colors: [.red, .yellow, .green, .blue]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    // MARK: View
    var body: some View {
        Button(action: {
            onRequest()
        }, label: {
            Image(uiImage: UIImage(named: "google_logo")!)
                .aspectRatio(contentMode: .fill)
                .padding(15)
        })
        .overlay(border)
    }
}

extension SocialGoogleButton {
    private var border: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(gradient, lineWidth: 1)
    }
}
