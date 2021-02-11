//
//  Auth0DataSource+FetchUser.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation
import Auth0

extension Auth0DataSource: FetchUserAuthDataSourceable {
    // MARK: Functionality
    func fetch(onCompletion: @escaping FetchUserAuthResult) {
        manager.credentials { (error, credentials)  in
            if let error = error {
                onCompletion(.failure(.unkown(error)))
                return
            }

            guard let accessToken = credentials?.accessToken else {
                onCompletion(.failure(.credentials))
                return
            }

            Auth0
                .authentication()
                .userInfo(withAccessToken: accessToken)
                .start { result in
                    switch result {
                    case .success(let profile):
                        onCompletion(.success(profile.transform()))
                    case .failure(let error):
                        onCompletion(.failure(.unkown(error)))
                    }
                }
        }
    }
}
