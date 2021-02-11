//
//  UserCard.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 11/2/21.
//

import SwiftUI

struct ProfileDetailsUser: View {
    // MARK: Properties
    private var user: User
    private var radius: CGFloat = 20
    private var progression: Float

    // MARK: Constructor
    init(user: User, progression: Float) {
        self.user = user
        self.progression = progression
    }

    // MARK: Views
    var body: some View {
        VStack {
            userView
            progressionView
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: radius))
        .shadow(color: Color.gray.opacity(0.3), radius: 18, y: 6)
        .padding()
    }

    var userView: some View {
        VStack {
            ProfileUserImage(pictureData: user.pictureData)
                .frame(width: 80, height: 80)
                .padding(10)

            Text(user.name ?? "Name")
                .foregroundColor(.white)
                .font(.headline)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: radius))
    }

    var progressionView: some View {
        VStack {
            Text("\(String(format: "%.f", progression))%")
                .foregroundColor(Color.accentColor)
                .font(.footnote)
                .bold()

            ProgressView(value: progression, total: 100)
                .padding(.horizontal)
                .padding(.bottom)

            Button(action: {

            }, label: {
                Text("Complete your profile")
                    .foregroundColor(.accentColor)
                    .font(.footnote)
            })
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color.white)
            .overlay(Capsule().stroke(Color.accentColor))
        }
        .padding(.vertical)
    }
}
