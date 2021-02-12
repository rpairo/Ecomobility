//
//  LoginView.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 4/2/21.
//

import SwiftUI

struct LoginView: View {
    // MARK: Properties
    @StateObject var viewModel: LoginViewModel

    // MARK: View
    var body: some View {
        VStack {
            logoSection
            Spacer()
            buttonsSection
        }
    }
}

// MARK: Sections
extension LoginView {
    // MARK: Views
    var buttonsSection: some View {
        VStack(alignment: .center) {
            LoginButton(title: "SIGN IN") {
                viewModel.signInTapped()
            }.sheet(isPresented: $viewModel.showingSignIn) {
                SignInView(viewModel: Injector.shared.resolve())
            }

            LoginSignUpButton(title: "Don't have an account? Sign up") {
                viewModel.signUpTapped()
            }.sheet(isPresented: $viewModel.showingSignUp) {
                SignUpView(viewModel: Injector.shared.resolve())
            }
        }
    }

    // MARK: Components
    var logoSection: some View {
        GeometryReader { geometry in
            Image("login_mosaic")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
        }
        .edgesIgnoringSafeArea(.top)
    }
}
