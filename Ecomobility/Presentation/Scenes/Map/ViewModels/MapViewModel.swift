//
//  MapViewModel.swift
//  Ecomobility
//
//  Created by Raúl Pera Pairó on 7/2/21.
//

import Foundation
import MapKit

final class MapViewModel: ObservableObject {
    // MARK: Properties
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )

    // MARK: Events
    func scanTapped() {
        NSLog("Scaning...")
    }
}
