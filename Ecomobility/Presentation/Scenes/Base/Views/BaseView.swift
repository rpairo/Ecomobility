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
            case .base:
                baseFlow
                    .transition(.scale)
            }
        }.onAppear {
            viewModel.onAppear { page in
                viewRouter.currentPage = page
            }
        }
    }
}

// MARK: Flows
extension BaseView {
    // MARK: Views
    var loginFlow: some View {
        LoginView(viewModel: Injector().resolve())
    }

    var baseFlow: some View {
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
