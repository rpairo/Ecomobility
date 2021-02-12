//
//  Auth0DataSource+FetchUser.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation
import Auth0

// It is necessary to use the Swift namespace by collision of names
// with the Result type and the Auth0 library
private typealias TokenResult = (Swift.Result<String, FetchUserError>) -> Void

extension Auth0DataSource: FetchUserAuthDataSourceable {
    // MARK: Functionality
    func fetch(onCompletion: @escaping FetchUserAuthResult) {
        fetchAccesToken { result in
            switch result {
            case .success(let token):
                self.fetchUserInfo(token: token, onCompletion: onCompletion)
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }

    private func fetchAccesToken(onCompletion: @escaping TokenResult) {
        manager.credentials { (error, credentials) in
            if let error = error {
                onCompletion(.failure(.unkown(error)))
                return
            }

            guard let accessToken = credentials?.accessToken else {
                onCompletion(.failure(.credentials))
                return
            }

            onCompletion(.success(accessToken))
        }
    }

    private func fetchUserInfo(token: String, onCompletion: @escaping FetchUserAuthResult) {
        Auth0
            .authentication()
            .userInfo(withAccessToken: token)
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
