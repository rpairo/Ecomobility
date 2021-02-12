//
//  EcomobilityApp.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 1/2/21.
//

import SwiftUI

@main
struct EcomobilityApp: App {
    // MARK: Properties
    @StateObject var viewRouter: ViewRouter = Injector.shared.resolve()

    // MARK: Constructor
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(.accentColor)
        ]

        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(.accentColor)
        ]
    }

    // MARK: Scene
    var body: some Scene {
        WindowGroup {
            BaseView(viewModel: Injector.shared.resolve())
                .environmentObject(viewRouter)
                .statusBar(hidden: true)
        }
    }
}
