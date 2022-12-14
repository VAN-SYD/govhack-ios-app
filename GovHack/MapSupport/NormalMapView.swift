//
//  NormalMapView.swift
//  GovHack
//
//  Created by Max Chuquimia on 20/8/2022.
//

import SwiftUI
import MapKit

struct NormalMapView: UIViewRepresentable {

    let places: [MapLocation]
    @Binding var selectedPlace: MapLocation?
    @Binding var displayedRegion: MKCoordinateRegion

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator

        mapView.setRegion(displayedRegion, animated: false)

        mapView.mapType = .mutedStandard // Muted looks so bad, doesn't remove POIs
        mapView.pointOfInterestFilter = .init(including: [.cafe, .carRental, .parking, .hotel, .evCharger, .publicTransport])
        mapView.showsBuildings = true

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        context.coordinator.update(map: uiView, places: places)
//
//        if uiView.region != displayedRegion {
//            uiView.setRegion(displayedRegion, animated: false)
//        }
    }
}

struct NormalMapView_Previews: PreviewProvider {
    static var previews: some View {
        NormalMapView(
            places: [
                MapLocation(
                    propertyId: "",
                    coordinate: CLLocationCoordinate2D(latitude: -33.8865505412147, longitude: 151.21161037477057)
                )
            ],
            selectedPlace: .constant(nil),
            displayedRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -33.8865505412147, longitude: 151.21161037477057), latitudinalMeters: 1400, longitudinalMeters: 1400))
        )
    }
}
