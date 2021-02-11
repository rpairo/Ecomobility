//
//  SignUpButton.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 6/2/21.
//

import SwiftUI

struct LoginSignUpButton: View {
    // MARK: Properties
    var title: String
    var action: () -> Void

    // MARK: View
    var body: some View {
        Button(title) {
            action()
        }
        .font(.footnote)
        .padding()
    }
}
