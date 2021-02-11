//
//  LogoutAuthCredentialsUseCaseable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

typealias LogoutAuthResult = (Result<Bool, Error>) -> Void

protocol LogoutAuthUseCaseable {
    // MARK: Functionality
    func execute(onCompletion: @escaping LogoutAuthResult)
}
