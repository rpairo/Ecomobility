//
//  BaseView.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import SwiftUI

struct BaseView: View {
    // MARK: Properties
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var viewModel: BaseViewModel

    // MARK: View
    var body: some View {
        VStack {
            switch viewRouter.currentScene {
            case .login:
                loginFlow
            case .base:
                baseFlow
                    .transition(.scale)
            }
        }.onAppear {
            viewModel.onAppear { scene in
                viewRouter.currentScene = scene
            }
        }
    }
}

// MARK: Flows
extension BaseView {
    // MARK: Views
    var loginFlow: some View {
        LoginView(viewModel: Injector.shared.resolve())
    }

    var baseFlow: some View {
        TabView {
            MapView(viewModel: Injector.shared.resolve())
                .tag(0)
                .tabItem {
                    Text("Map")
                    Image(systemName: "map.fill")
                }

            ProfileView(viewModel: Injector.shared.resolve())
                .tag(1)
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person.crop.circle")
                }
        }
    }
}
