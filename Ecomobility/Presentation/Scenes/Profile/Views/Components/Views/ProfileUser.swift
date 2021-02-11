//
//  ProfileUser.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import SwiftUI

struct ProfileUser: View {
    // MARK: Properties
    var name: String
    var email: String
    var picture: Data?

    // MARK: View
    var body: some View {
        HStack(spacing: 20) {
            userImage
            profileInfoSection
            Spacer()
            arrow
        }
        .padding(.vertical, 5)
    }
}

extension ProfileUser {
    // MARK: Views
    private var profileInfoSection: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(name)
                .font(.headline)
                .foregroundColor(Color(.darkGray))

            Text(email)
                .font(.footnote)
                .foregroundColor(Color(.lightGray))
        }
    }

    // MARK: Components
    private var userImage: some View {
        ProfileUserImage(picture: picture, color: Color(.lightGray))
            .frame(width: 60, height: 60)
    }

    private var arrow: some View {
        Image(systemName: "chevron.forward")
            .renderingMode(.template)
            .foregroundColor(Color(.lightGray))
    }
}
