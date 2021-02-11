//
//  SocialFacebookButton.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 6/2/21.
//

import SwiftUI

struct SocialFacebookButton: View {
    // MARK: Properties
    var onRequest: () -> Void
    var onResult: () -> Void
    var title: String

    // MARK: View
    var body: some View {
        Button(action: {
            onRequest()
        }, label: {
            Image(uiImage: UIImage(named: "facebook_logo")!)
                .renderingMode(.template)
                .foregroundColor(.blue)
                .aspectRatio(contentMode: .fill)
                .padding(15)
        })
        .overlay(border)
    }
}

extension SocialFacebookButton {
    private var border: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color.blue, lineWidth: 1)
    }
}
