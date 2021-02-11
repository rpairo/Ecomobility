//
//  Auth0DataSource+Store.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation
import Auth0

extension Auth0DataSource: StoreAuthDataSourceable {
    // MARK: Functionality
    func store(credentials: AuthCredentials, onCompletion: @escaping StoreAuthResult) {
        let cretendialsDTO = Credentials(credentials)
        let result = manager.store(credentials: cretendialsDTO)

        switch result {
        case true:
            onCompletion(.success(result))
        case false:
            onCompletion(.failure(NSError()))
        }
    }
}
