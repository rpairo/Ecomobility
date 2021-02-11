//
//  StoreAuthDataSourceable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

protocol StoreAuthDataSourceable {
    // MARK: Functionality
    func store(credentials: AuthCredentials, onCompletion: @escaping StoreAuthResult)
}
