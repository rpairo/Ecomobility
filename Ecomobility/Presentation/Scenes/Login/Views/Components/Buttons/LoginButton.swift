//
//  LoginButton.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 4/2/21.
//

import SwiftUI

struct LoginButton: View {
    // MARK: Properties
    var title: String
    var action: () -> Void

    // MARK: View
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
        })
        .background(Color.accentColor)
        .clipShape(Capsule())
        .padding(.horizontal, 30)
    }
}
