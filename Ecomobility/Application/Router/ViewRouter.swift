//
//  ViewRouter.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 7/2/21.
//

import Foundation

enum Scenes {
    // MARK: Cases
    case login
    case base
}

class ViewRouter: ObservableObject {
    // MARK: Properties
    @Published var currentScene: Scenes = .login
}
