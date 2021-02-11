//
//  ProfileProgressView.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 11/2/21.
//

import SwiftUI

struct ProfileProgressView: View {
    // MARK: Properties
    var progression: Float
    var title: String
    var action: () -> Void

    // MARK: View
    var body: some View {
        VStack {
            progressNumber
            progressView
            button
        }
        .padding(.vertical)
    }
}

extension ProfileProgressView {
    // MARK: Components
    private var progressNumber: some View {
        Text("\(String(format: "%.f", progression))%")
            .foregroundColor(Color.accentColor)
            .font(.footnote)
            .bold()
    }

    private var progressView: some View {
        ProgressView(value: progression, total: 100)
            .padding(.horizontal)
            .padding(.bottom)
    }

    private var button: some View {
        Button(action: {
            action()
        }, label: {
            titleView
        })
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.white)
        .overlay(Capsule().stroke(Color.accentColor))
    }

    private var titleView: some View {
        Text(title)
            .foregroundColor(.accentColor)
            .font(.footnote)
    }
}
