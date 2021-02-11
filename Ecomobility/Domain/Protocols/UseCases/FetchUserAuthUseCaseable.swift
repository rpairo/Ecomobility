//
//  FetchUserAuthUseCaseable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

typealias FetchUserAuthResult = (Result<User, FetchUserError>) -> Void

enum FetchUserError: Error {
    case credentials
    case unkown(Error)
}

protocol FetchUserAuthUseCaseable {
    // MARK: Functionality
    func execute(onCompletion: @escaping FetchUserAuthResult)
}
