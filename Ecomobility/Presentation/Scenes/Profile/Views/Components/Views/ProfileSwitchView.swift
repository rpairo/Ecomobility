//
//  ProfileSwitchView.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 11/2/21.
//

import SwiftUI

struct ProfileSwitchView: View {
    // MARK: Properties
    var title: String
    var image: Image
    @Binding var isOn: Bool

    // MARK: View
    var body: some View {
        HStack {
            icon
            toggle
        }
    }
}

extension ProfileSwitchView {
    // MARK: Components
    private var icon: some View {
        image
            .foregroundColor(.accentColor)
    }

    private var toggle: some View {
        Toggle(title, isOn: $isOn)
            .foregroundColor(Color(.darkGray))
            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
    }
}
