//
//  Auth0DataSource+Fetch.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation
import Auth0

extension Auth0DataSource: FetchAuthDataSourceable {
    // MARK: Functionality
    func fetch(onCompletion: @escaping FetchAuthResult) {
        guard let domain = domain else { return }

        Auth0
            .webAuth()
            .scope("openid profile email offline_access")
            .audience("https://\(domain)/userinfo")
            .start { result in
                switch result {
                case .success(let credentials):
                    onCompletion(.success(credentials.transform()))
                case .failure(let error):
                    onCompletion(.failure(error))
                }
            }
    }
}
