//
//  FetchAuthUseCase.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

struct FetchAuthUseCase: FetchAuthUseCaseable {
    // MARK: Properties
    var authRepository: AuthRepositable

    // MARK: Functionality
    func execute(onCompletion: @escaping FetchAuthResult) {
        authRepository.fetch(onCompletion: onCompletion)
    }
}
