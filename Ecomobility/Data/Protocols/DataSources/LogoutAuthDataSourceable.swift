//
//  LogoutAuthDataSourceable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

protocol LogoutAuthDataSourceable {
    // MARK: Functionality
    func logout(onCompletion: @escaping LogoutAuthResult)
}
