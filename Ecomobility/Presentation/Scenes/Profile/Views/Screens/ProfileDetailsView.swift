//
//  ProfileDetailsView.swift
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
            userImageSection
            userInfoSection
        }
        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

// MARK: Sections
extension ProfileDetailsView {
    // MARK: Views
    var userImageSection: some View {
        ProfileDetailsUser(
            name: viewModel.user.name ?? "Name",
            picture: viewModel.user.pictureData,
            progression: 70,
            titleButton: "Complete your profile"
        ) {
            viewModel.completeProfileTapped()
        }
    }

    var userInfoSection: some View {
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
    }
}
