//
//  ProfileLogoutButton.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import SwiftUI

struct ProfileLogoutButton: View {
    // MARK: Properties
    var action: () -> Void

    // MARK: View
    var body: some View {
        button
    }
}

extension ProfileLogoutButton {
    // MARK: Components
    private var button: some View {
        Button(action: {
            action()
        }, label: {
            title
        })
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    }

    private var title: some View {
        Text("Log out")
            .foregroundColor(.red)
    }
}
