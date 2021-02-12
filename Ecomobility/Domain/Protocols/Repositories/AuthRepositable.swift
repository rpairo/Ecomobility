//
//  AuthRepositable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

protocol AuthRepositable {
    // MARK: Functionality
    func fetch(onCompletion: @escaping FetchAuthResult)
    func logout(onCompletion: @escaping LogoutAuthResult)
    func store(credentials: AuthCredentials, onCompletion: @escaping StoreAuthResult)
    func check(onCompletion: @escaping CheckAuthResult)
    func fetch(onCompletion: @escaping FetchUserAuthResult)
}
