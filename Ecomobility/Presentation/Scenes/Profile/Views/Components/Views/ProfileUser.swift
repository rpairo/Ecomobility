//
//  SettingsProfile.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import SwiftUI

struct ProfileUser: View {
    // MARK: Properties
    var user: User

    // MARK: View
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            ProfileUserImage(pictureData: user.pictureData)
                .frame(width: 60, height: 60)

            VStack(alignment: .leading, spacing: 5) {
                Text(user.name ?? "Full name")
                    .font(.headline)
                    .foregroundColor(Color(UIColor.darkGray))

                Text(user.email ?? "Email")
                    .font(.footnote)
                    .foregroundColor(Color(UIColor.lightGray))
            }

            Spacer()

            Image(systemName: "chevron.forward")
                .renderingMode(.template)
                .foregroundColor(Color(UIColor.lightGray))
        }
        .padding(.vertical, 5)
    }
}
