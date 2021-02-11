//
//  LoginTextField.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 4/2/21.
//

import SwiftUI

struct LoginTextField: View {
    // MARK: Properties
    var placeholder: String
    @Binding var input: String

    // MARK: View
    var body: some View {
        TextField(placeholder, text: $input)
            .disableAutocorrection(true)
            .foregroundColor(.accentColor)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .overlay(border)
            .padding(.horizontal, 30)
    }
}

// MARK: Border
extension LoginTextField {
    private var border: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color.accentColor, lineWidth: 1)
    }
}
