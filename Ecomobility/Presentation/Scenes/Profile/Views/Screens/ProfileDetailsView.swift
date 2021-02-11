//
//  UserDetailView.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import SwiftUI

struct ProfileDetailsView: View {
    // MARK: Properties
    @ObservedObject var viewModel: UserDetailsViewModel

    // MARK: View
    var body: some View {
        VStack {
            ProfileDetailsUser(user: viewModel.user, progression: 70)

            VStack {
                ProfileDetailsRow(title: "Given name", value: viewModel.user.givenName ?? "Given name")
                Divider()
                ProfileDetailsRow(title: "Family name", value: viewModel.user.familyName ?? "Family name")
                Divider()
                ProfileDetailsRow(title: "Nick name", value: viewModel.user.nickname ?? "Nick name")
                Divider()
                ProfileDetailsRow(title: "Email", value: viewModel.user.email ?? "Email")
            }
            .padding(10)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.gray.opacity(0.3), radius: 18, y: 6)
            .padding()

            Spacer()
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}