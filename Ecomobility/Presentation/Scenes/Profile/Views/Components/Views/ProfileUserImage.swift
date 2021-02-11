//
//  ProfileUserImage.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 11/2/21.
//

import SwiftUI

struct ProfileUserImage: View {
    // MARK: Properties
    var pictureData: Data?

    // MARK: Views
    var body: some View {
        userImage
            .resizable()
            .scaledToFill()
            .foregroundColor(Color(.lightGray))
            .clipShape(Circle())
    }

    var userImage: Image {
        if let data = pictureData, let image = UIImage(data: data) {
            return Image(uiImage: image)
        }

        return Image(systemName: "person.crop.circle.fill")
    }
}
