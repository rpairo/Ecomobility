//
//  SettingsButton.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 10/2/21.
//

import SwiftUI

struct ProfileSettingsButton: View {
    // MARK: Properties
    var buttonTapped: () -> Void

    // MARK: View
    var body: some View {
        Button(action: {
            buttonTapped()
        }, label: {
            Image(systemName: "gear")
        })
    }
}
