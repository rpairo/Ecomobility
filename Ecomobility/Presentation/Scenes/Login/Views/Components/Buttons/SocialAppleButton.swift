//
//  SocialAppleButton.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 3/2/21.
//

import SwiftUI
import AuthenticationServices

struct SocialAppleButton: View {
    // MARK: Properties
    var onRequest: (ASAuthorizationAppleIDRequest) -> Void
    var onResult: (Result<ASAuthorization, Error>) -> Void

    // MARK: View
    var body: some View {
        button
    }
}

extension SocialAppleButton {
    // MARK: Components
    private var button: some View {
        Button(action: {
        }, label: {
            Image(uiImage: UIImage(named: "apple_logo")!)
                .renderingMode(.template)
                .foregroundColor(.black)
                .aspectRatio(contentMode: .fill)
                .padding(15)
        })
        .overlay(border)
    }

    private var border: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color.black, lineWidth: 1)
    }
}
