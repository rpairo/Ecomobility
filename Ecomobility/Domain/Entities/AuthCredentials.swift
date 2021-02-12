//
//  AuthCredentials.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

struct AuthCredentials {
    // MARK: Properties
    let accessToken: String?
    let expiresIn: Date?
    let idToken: String?
    let refreshToken: String?
    let scope: String?
    let tokenType: String?
}
