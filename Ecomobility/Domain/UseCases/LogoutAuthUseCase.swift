//
//  LogoutAuthUseCase.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

struct LogoutAuthUseCase: LogoutAuthUseCaseable {
    // MARK: Properties
    var authRepository: AuthRepositable

    // MARK: Constructor
    init(repository: AuthRepositable) {
        self.authRepository = repository
    }

    // MARK: Functionality
    func execute(onCompletion: @escaping LogoutAuthResult) {
        authRepository.logout(onCompletion: onCompletion)
    }
}
