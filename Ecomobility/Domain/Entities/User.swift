//
//  User.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

struct User {
    // MARK: Properties
    var name: String?
    var email: String?
    var picture: String?
    var nickname: String?
    var familyName: String?
    var givenName: String?

    var pictureData: Data? {
        guard let picture = self.picture else { return nil }
        guard let url = URL(string: picture) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        return data
    }
}
