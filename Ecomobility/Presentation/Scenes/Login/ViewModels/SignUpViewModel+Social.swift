//
//  SignUpViewModel+Social.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation
import AuthenticationServices

// MARK: Social authentication
extension SignUpViewModel: SocialAuthenticable {
    func appleOnRequestAuthentication(request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }

    func appleOnResultAuthentication(result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authoritation):
            NSLog(authoritation.description)
        case .failure(let error):
            NSLog(error.localizedDescription)
        }
    }

    func facebookOnRequestAuthentication() {
        NSLog("Facebook login request")
    }

    func facebookOnResultAuthentication() {
        NSLog("Facebook login result")
    }

    func googleOnRequestAuthentication() {
        NSLog("Google login request")
    }

    func googleOnResultAuthentication() {
        NSLog("Google login result")
    }
}
