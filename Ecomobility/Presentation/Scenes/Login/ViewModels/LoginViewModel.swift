//
//  LoginViewModel.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 4/2/21.
//

import Foundation

final class LoginViewModel: ObservableObject {
    // MARK: Properties
    @Published var showingSignIn = false
    @Published var showingSignUp = false
}

// MARK: Events
extension LoginViewModel {
    func signInTapped() {
        showingSignIn.toggle()
    }

    func signUpTapped() {
        showingSignUp.toggle()
    }
}
