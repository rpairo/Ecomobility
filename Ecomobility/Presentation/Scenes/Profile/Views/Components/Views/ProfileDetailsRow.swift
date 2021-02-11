//
//  ProfileDetailsInfoRow.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 11/2/21.
//

import SwiftUI

struct ProfileDetailsRow: View {
    // MARK: Properties
    var title: String
    var value: String

    // MARK: View
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .foregroundColor(.gray)
                    .font(.caption)

                Text(value)
                    .foregroundColor(Color(.darkGray))
                    .font(.body)
            }

            Spacer()

            Button(action: {
            }, label: {
                Image(systemName: "pencil")
            })
        }
        .padding(10)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}
