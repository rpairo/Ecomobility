//
//  StoreAuthUseCase.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

struct StoreAuthUseCase: StoreAuthUseCaseable {
    // MARK: Properties
    var authRepository: AuthRepositable

    // MARK: Constructor
    init(repository: AuthRepositable) {
        self.authRepository = repository
    }

    // MARK: Functionality
    func store(credentials: AuthCredentials, onCompletion: @escaping StoreAuthResult) {
        authRepository.store(credentials: credentials, onCompletion: onCompletion)
    }
}
