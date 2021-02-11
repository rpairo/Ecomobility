//
//  Credentials+DTO.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation
import Auth0

extension Credentials {
    // MARK: Constructor
    convenience init(_ credentials: AuthCredentials) {
        self.init(
            accessToken: credentials.accessToken,
            tokenType: credentials.tokenType,
            idToken: credentials.idToken,
            refreshToken: credentials.refreshToken,
            expiresIn: credentials.expiresIn,
            scope: credentials.scope
        )
    }

    // MARK: Functionality
    func transform() -> AuthCredentials {
        AuthCredentials(
            accessToken: self.accessToken,
            expiresIn: self.expiresIn,
            idToken: self.idToken,
            refreshToken: self.refreshToken,
            scope: self.scope,
            tokenType: self.tokenType
        )
    }
}
