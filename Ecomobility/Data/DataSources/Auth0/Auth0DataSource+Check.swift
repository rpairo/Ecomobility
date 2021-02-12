//
//  Auth0DataSource+Check.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation
import Auth0

extension Auth0DataSource: CheckAuthDataSourceable {
    // MARK: Functionality
    func check(onCompletion: @escaping CheckAuthResult) {
        guard manager.hasValid() else {
            onCompletion(.failure(NSError()))
            return
        }

        manager.credentials { error, credentials in
            guard error == nil, let credentials = credentials else {
                onCompletion(.failure(NSError()))
                return
            }

            onCompletion(.success(credentials.transform()))
        }
    }
}
