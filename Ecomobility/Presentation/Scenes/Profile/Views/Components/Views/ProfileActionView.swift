//
//  ProfileActionView.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 11/2/21.
//

import SwiftUI

struct ProfileActionView: View {
    // MARK: Properties
    var title: String
    var image: Image
    var imageButton: Image
    var action: () -> Void

    // MARK: View
    var body: some View {
        HStack {
            icon
            titleView
            Spacer()
            button
        }
    }
}

extension ProfileActionView {
    // MARK: Components
    private var icon: some View {
        image
            .foregroundColor(.accentColor)
    }

    private var titleView: some View {
        Text(title)
            .foregroundColor(Color(.darkGray))
    }

    private var button: some View {
        Button(action: {
            action()
        }, label: {
            imageButton
        })
    }
}
