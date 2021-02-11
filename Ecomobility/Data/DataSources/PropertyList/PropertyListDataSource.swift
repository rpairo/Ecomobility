//
//  PropertyListDataSource.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

struct PropertyListDataSource: FetchUserAuthDataSourceable {
    // MARK: Properties
    var properties: UserProperties? {
        let file = "PlaceholderDataset"
        let type = "plist"

        guard let url = Bundle.main.url(forResource: file, withExtension: type) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }

        let decoder = PropertyListDecoder()
        guard let properties = try? decoder.decode(UserProperties.self, from: data) else { return nil }

        return properties
    }

    // MARK: Functionality
    func fetch(onCompletion: @escaping FetchUserAuthResult) {
        guard let user = properties else { return }

        let userBO = User(
            name: user.name,
            email: user.email,
            picture: user.picture
        )

        onCompletion(.success(userBO))
    }
}
