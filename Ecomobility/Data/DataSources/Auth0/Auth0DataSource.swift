//
//  Auth0DataSource.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation
import Auth0

class Auth0DataSource {
    // MARK: Properties
    let manager = CredentialsManager(authentication: Auth0.authentication())

    var domain: String? {
        let file = "Auth0"
        let type = "plist"

        guard let url = Bundle.main.url(forResource: file, withExtension: type) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }

        let decoder = PropertyListDecoder()
        guard let properties = try? decoder.decode(Auth0Properties.self, from: data) else { return nil }

        return properties.domain
    }
}
