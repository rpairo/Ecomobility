//
//  ProfileUserImage.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 11/2/21.
//

import SwiftUI

struct ProfileUserImage: View {
    // MARK: Properties
    var picture: Data?
    var color: Color

    // MARK: Views
    var body: some View {
        userImage
            .resizable()
            .scaledToFill()
            .foregroundColor(color)
            .clipShape(Circle())
    }
}

extension ProfileUserImage {
    // MARK: Components
    private var userImage: Image {
        if let data = picture, let image = UIImage(data: data) {
            return Image(uiImage: image)
        }

        return Image(systemName: "person.crop.circle.fill")
    }
}
