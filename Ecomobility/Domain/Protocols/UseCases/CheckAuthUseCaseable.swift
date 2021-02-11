//
//  CheckAuthUseCase.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

typealias CheckAuthResult = (Result<AuthCredentials, Error>) -> Void

protocol CheckAuthUseCaseable {
    // MARK: Functionality
    func check(onCompletion: @escaping CheckAuthResult)
}
