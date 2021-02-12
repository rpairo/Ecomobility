//
//  SocialAuthenticable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 6/2/21.
//

import Foundation
import AuthenticationServices

protocol SocialAuthenticable {
    // MARK: Functionality
    func appleOnRequestAuthentication(request: ASAuthorizationAppleIDRequest)
    func appleOnResultAuthentication(result: Result<ASAuthorization, Error>)
    func facebookOnRequestAuthentication()
    func facebookOnResultAuthentication()
    func googleOnRequestAuthentication()
    func googleOnResultAuthentication()
}
