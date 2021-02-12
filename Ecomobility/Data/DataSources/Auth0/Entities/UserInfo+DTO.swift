//
//  UserInfo+DTO.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 11/2/21.
//

import Foundation
import Auth0

extension UserInfo {
    // MARK: Functionality
    func transform() -> User {
        User(
            name: self.name,
            email: self.email,
            picture: self.picture?.absoluteString,
            nickname: self.nickname,
            familyName: self.familyName,
            givenName: self.givenName
        )
    }
}
