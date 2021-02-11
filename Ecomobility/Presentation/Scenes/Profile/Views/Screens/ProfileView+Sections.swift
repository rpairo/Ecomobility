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
            ProfileUser(user: viewModel.user)
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
            HStack(spacing: 10) {
                Image(systemName: "creditcard")
                    .renderingMode(.template)
                    .foregroundColor(.accentColor)

                Text(viewModel.amount)
                    .foregroundColor(Color(UIColor.darkGray))

                Spacer()

                Button(action: {

                }, label: {
                    Image(systemName: "plus.circle")
                })
            }
        }
    }

    var ridesSection: some View {
        Section(header: Text("Rides")) {
            HStack(spacing: 10) {
                Image(systemName: "mappin.and.ellipse")
                    .renderingMode(.template)
                    .foregroundColor(.accentColor)

                Text("12 Rides")
                    .foregroundColor(Color(UIColor.darkGray))

                Spacer()

                Button(action: {

                }, label: {
                    Image(systemName: "list.bullet")
                })
            }
        }
    }

    var notificationsSection: some View {
        Section(header: Text("Notifications")) {
            HStack(spacing: 10) {
                Image(systemName: "app.badge")
                    .renderingMode(.template)
                    .foregroundColor(.accentColor)

                Toggle("Push", isOn: $viewModel.isPushNotificated)
                    .foregroundColor(Color(UIColor.darkGray))
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
            }

            HStack(spacing: 10) {
                Image(systemName: "newspaper")
                    .renderingMode(.template)
                    .foregroundColor(.accentColor)

                Toggle("News", isOn: $viewModel.isNewsNotificated)
                    .foregroundColor(Color(UIColor.darkGray))
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
            }
        }
    }
}
