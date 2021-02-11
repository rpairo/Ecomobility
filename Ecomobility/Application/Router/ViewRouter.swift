//
//  ViewRouter.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 7/2/21.
//

import Foundation

enum Page {
    // MARK: Cases
    case login
    case map
}

class ViewRouter: ObservableObject {
    // MARK: Properties
    @Published var currentPage: Page = .login
}
