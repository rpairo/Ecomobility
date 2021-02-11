//
//  FetchUserAuthDataSourceable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

protocol FetchUserAuthDataSourceable {
    // MARK: Functionality
    func fetch(onCompletion: @escaping FetchUserAuthResult)
}
