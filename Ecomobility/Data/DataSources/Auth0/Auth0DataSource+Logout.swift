//
//  Auth0DataSource+Logout.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation
import Auth0

extension Auth0DataSource: LogoutAuthDataSourceable {
    // MARK: Functionality
    func logout(onCompletion: @escaping LogoutAuthResult) {
        // Revoke token manager
        manager.revoke { result in
            if let error = result {
                onCompletion(.failure(error))
            }
        }

        // Remove auth session
        Auth0
            .webAuth()
            .clearSession(federated: false) { result in
                switch result {
                case true:
                    onCompletion(.success(result))
                case false:
                    onCompletion(.failure(NSError()))
                }
            }
    }
}
