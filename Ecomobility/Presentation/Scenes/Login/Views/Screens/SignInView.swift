//
//  SignInView.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 4/2/21.
//

import SwiftUI

struct SignInView: View {
    // MARK: Properties
    @ObservedObject var viewModel: SignInViewModel
    @EnvironmentObject var viewRouter: ViewRouter

    // MARK: View
    var body: some View {
        VStack {
            Spacer()

            Image("company_logo")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 50)
                .padding()

            VStack(alignment: .center, spacing: 15) {
                LoginTextField(placeholder: "Email", input: $viewModel.email)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)

                LoginSecureField(placeholder: "Password", input: $viewModel.password)
            }
            .padding(.top, 60)

            Spacer()

            LoginButton(title: "SIGN IN") {
                viewModel.authenticate { page in
                    viewRouter.currentPage = page
                }
            }

            Text("- OR -")
                .padding(3)
                .font(.caption)
                .foregroundColor(.accentColor)

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
    }
}
