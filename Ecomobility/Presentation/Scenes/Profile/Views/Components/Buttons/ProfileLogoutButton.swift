//
//  LogoutButton.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import SwiftUI

struct ProfileLogoutButton: View {
    // MARK: Properties
    var buttonTapped: () -> Void

    // MARK: View
    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            Button(action: {
                buttonTapped()
            }, label: {
                Text("Log out")
                    .foregroundColor(.red)
            })

            Spacer()
        }
    }
}
