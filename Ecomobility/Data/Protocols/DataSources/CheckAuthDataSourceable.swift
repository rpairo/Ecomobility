//
//  CheckAuthDataSourceable.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import Foundation

protocol CheckAuthDataSourceable {
    // MARK: Functionality
    func check(onCompletion: @escaping CheckAuthResult)
}
