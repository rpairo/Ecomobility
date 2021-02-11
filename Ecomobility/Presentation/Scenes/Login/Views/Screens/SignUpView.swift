//
//  SignUpView.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 4/2/21.
//

import SwiftUI

struct SignUpView: View {
    // MARK: Properties
    @ObservedObject var viewModel: SignUpViewModel
    @EnvironmentObject var viewRouter: ViewRouter

    // MARK: View
    var body: some View {
        VStack {
            Spacer()
            logoSection
            fieldsSection
            Spacer()
            loginButtonSection
            textSeparatorSection
            socialButtonsSection
        }
    }
}

// MARK: Sections
extension SignUpView {
    // MARK: Views
    var fieldsSection: some View {
        VStack(alignment: .center, spacing: 15) {
            LoginTextField(placeholder: "Full name", input: $viewModel.name)
                .textContentType(.name)

            LoginTextField(placeholder: "Email", input: $viewModel.email)
                .textContentType(.emailAddress)
                .autocapitalization(.none)

            LoginSecureField(placeholder: "Password", input: $viewModel.password)
        }
        .padding(.top, 60)
    }

    var socialButtonsSection: some View {
        HStack(spacing: 15) {
            SocialAppleButton(
                onRequest: viewModel.appleOnRequestAuthentication,
                onResult: viewModel.appleOnResultAuthentication
            )

            SocialFacebookButton(
                onRequest: viewModel.facebookOnRequestAuthentication,
                onResult: viewModel.facebookOnResultAuthentication,
                title: "Sign in with Facebook"
            )

            SocialGoogleButton(
                onRequest: viewModel.facebookOnRequestAuthentication,
                onResult: viewModel.facebookOnResultAuthentication,
                title: "Sign in with Google"
            )
        }
        .padding(.bottom, 5)
    }

    // MARK: Components
    var logoSection: some View {
        Image("company_logo")
            .resizable()
            .scaledToFill()
            .frame(width: 350, height: 50)
            .padding()
    }

    var loginButtonSection: some View {
        LoginButton(title: "SIGN UP") {
            viewModel.signUpTapped { page in
                viewRouter.currentPage = page
            }
        }
    }

    var textSeparatorSection: some View {
        Text("- OR -")
            .padding(3)
            .font(.caption)
            .foregroundColor(.accentColor)
    }
}
