//
//  ProfileView+Sections.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import SwiftUI

// MARK: Sections
extension ProfileView {
    var userSection: some View {
        Section(header: Text("User")) {
            ProfileUser(
                name: viewModel.user.name ?? "Name",
                email: viewModel.user.email ?? "Email",
                picture: viewModel.user.pictureData
            )
            .sheet(isPresented: $profileSheet, content: {
                ProfileDetailsView(viewModel: Injector().resolve())
            })
            .onTapGesture {
                profileSheet.toggle()
            }
        }
    }

    var amountSection: some View {
        Section(header: Text("Amount")) {
            ProfileActionView(
                title: viewModel.amount,
                image: Image(systemName: "creditcard"),
                imageButton: Image(systemName: "plus.circle")
            ) {
                viewModel.amountTapped()
            }
        }
    }

    var ridesSection: some View {
        Section(header: Text("Rides")) {
            ProfileActionView(
                title: viewModel.rides,
                image: Image(systemName: "mappin.and.ellipse"),
                imageButton: Image(systemName: "list.bullet")
            ) {
                viewModel.ridesTapped()
            }
        }
    }

    var notificationsSection: some View {
        Section(header: Text("Notifications")) {
            ProfileSwitchView(
                title: "Push",
                image: Image(systemName: "app.badge"),
                isOn: $viewModel.isPushNotificated
            )

            ProfileSwitchView(
                title: "News",
                image: Image(systemName: "newspaper"),
                isOn: $viewModel.isNewsNotificated
            )
        }
    }

    var profileButtonSection: some View {
        ProfileLogoutButton {
            viewModel.logoutTapped { page in
                viewRouter.currentPage = page
            }
        }
    }
}
