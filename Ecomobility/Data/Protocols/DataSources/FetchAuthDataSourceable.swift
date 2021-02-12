//
//  FetchAuthDataSourceable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

protocol FetchAuthDataSourceable {
    // MARK: Functionality
    func fetch(onCompletion: @escaping FetchAuthResult)
}
