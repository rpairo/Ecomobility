//
//  ProfileView.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 7/2/21.
//

import SwiftUI

struct ProfileView: View {
    // MARK: Properties
    @State var profileSheet = false
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel: ProfileViewModel

    // MARK: View
    var body: some View {
        NavigationView {
            Form {
                userSection
                amountSection
                ridesSection
                notificationsSection

                ProfileLogoutButton {
                    viewModel.logoutTapped { page in
                        viewRouter.currentPage = page
                    }
                }
            }

            .navigationTitle("Profile")
            .navigationBarItems(trailing: ProfileSettingsButton {
                viewModel.settingsTapped()
            })
        }.onAppear {
            viewModel.onAppear()
        }
    }
}
