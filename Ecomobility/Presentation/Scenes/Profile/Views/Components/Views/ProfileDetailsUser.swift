//
//  ProfileDetailsUser.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 11/2/21.
//

import SwiftUI

struct ProfileDetailsUser: View {
    // MARK: Properties
    var name: String
    var picture: Data?
    var radius: CGFloat = 20
    var progression: Float
    var titleButton: String
    var action: () -> Void

    // MARK: Views
    var body: some View {
        VStack {
            userView
            progressView
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: radius))
        .shadow(color: Color.gray.opacity(0.3), radius: 18, y: 6)
        .padding()
    }
}

// MARK: Sections
extension ProfileDetailsUser {
    // MARK: Views
    private var userView: some View {
        VStack {
            userImage
            userName
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: radius))
    }

    // MARK: Components
    private var userImage: some View {
        ProfileUserImage(picture: picture, color: .white)
            .frame(width: 80, height: 80)
            .padding(10)
    }

    private var userName: some View {
        Text(name)
            .foregroundColor(.white)
            .font(.headline)
    }

    private var progressView: some View {
        ProfileProgressView(progression: progression, title: titleButton) {
            action()
        }
    }
}
