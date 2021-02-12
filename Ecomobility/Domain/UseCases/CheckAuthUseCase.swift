//
//  CheckAuthUseCase.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

struct CheckAuthUseCase: CheckAuthUseCaseable {
    // MARK: Properties
    var authRepository: AuthRepositable

    // MARK: Functionality
    func check(onCompletion: @escaping CheckAuthResult) {
        authRepository.check(onCompletion: onCompletion)
    }
}
