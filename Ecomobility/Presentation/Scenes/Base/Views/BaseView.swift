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
    @ObservedObject var viewModel: BaseViewModel

    // MARK: View
    var body: some View {
        VStack {
            switch viewRouter.currentPage {
            case .login:
                loginFlow
            case .map:
                mapFlow
                    .transition(.scale)
            }
        }.onAppear {
            viewModel.onAppear { page in
                viewRouter.currentPage = page
            }
        }
    }
}

// MARK: Login flow
extension BaseView {
    var loginFlow: some View {
        LoginView(viewModel: Injector().resolve())
    }
}

// MARK: Map flow
extension BaseView {
    var mapFlow: some View {
        TabView {
            MapView(viewModel: Injector().resolve())
                .tag(0)
                .tabItem {
                    Text("Map")
                    Image(systemName: "map.fill")
                }

            ProfileView(viewModel: Injector().resolve())
                .tag(1)
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person.crop.circle")
                }
        }
    }
}
