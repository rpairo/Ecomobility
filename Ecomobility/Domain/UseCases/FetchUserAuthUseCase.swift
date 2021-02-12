//
//  FetchUserAuthUseCase.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

struct FetchUserAuthUseCase: FetchUserAuthUseCaseable {
    // MARK: Properties
    var authRepository: AuthRepositable

    // MARK: Functionality
    func execute(onCompletion: @escaping FetchUserAuthResult) {
        authRepository.fetch(onCompletion: onCompletion)
    }
}
