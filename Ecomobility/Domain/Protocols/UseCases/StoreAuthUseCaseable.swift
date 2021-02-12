//
//  StoreAuthUseCaseable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

typealias StoreAuthResult = (Result<Bool, Error>) -> Void

protocol StoreAuthUseCaseable {
    // MARK: Functionality
    func store(credentials: AuthCredentials, onCompletion: @escaping StoreAuthResult)
}
