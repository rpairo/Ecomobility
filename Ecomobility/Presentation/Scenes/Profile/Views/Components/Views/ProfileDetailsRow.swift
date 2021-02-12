//
//  ProfileDetailsRow.swift
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
            textSection
            Spacer()
            button
        }
        .padding(10)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

// MARK: Sections
extension ProfileDetailsRow {
    // MARK: Views
    private var textSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            titleView
            valueView
        }
    }

    // MARK: Components
    private var titleView: some View {
        Text(title)
            .foregroundColor(.gray)
            .font(.caption)
    }

    private var valueView: some View {
        Text(value)
            .foregroundColor(Color(.darkGray))
            .font(.body)
    }

    private var button: some View {
        Button(action: {
        }, label: {
            Image(systemName: "pencil")
        })
    }
}
