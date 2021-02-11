//
//  MapView.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 7/2/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: Properties
    @ObservedObject var viewModel: MapViewModel

    // MARK: Views
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                map
                button
            }

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    companyLogo
                }
            }
        }
    }
}

// MARK: Sections
extension MapView {
    // MARK: Components
    var map: some View {
        Map(coordinateRegion: $viewModel.region,
            showsUserLocation: true,
            userTrackingMode: .constant(.follow))
    }

    var button: some View {
        MapScanButton {
            viewModel.scanTapped()
        }
    }

    var companyLogo: some View {
        Image("company_logo")
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
            .scaledToFit()
            .clipped()
    }
}
