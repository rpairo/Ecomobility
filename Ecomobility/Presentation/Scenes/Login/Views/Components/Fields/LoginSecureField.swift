//
//  LoginSecureField.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 4/2/21.
//

import SwiftUI

struct LoginSecureField: View {
    // MARK: Properties
    var placeholder: String
    @Binding var input: String

    // MARK: View
    var body: some View {
        field
    }
}

// MARK: Border
extension LoginSecureField {
    // MARK: Components
    private var field: some View {
        SecureField(placeholder, text: $input)
            .textContentType(.password)
            .foregroundColor(.accentColor)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .overlay(border)
            .padding(.horizontal, 30)
    }

    private var border: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color.accentColor, lineWidth: 1)
    }
}
