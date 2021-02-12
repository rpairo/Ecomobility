//
//  FetchAuthUseCaseable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

typealias FetchAuthResult = (Result<AuthCredentials, Error>) -> Void

protocol FetchAuthUseCaseable {
    // MARK: Functionality
    func execute(onCompletion: @escaping FetchAuthResult)
}
