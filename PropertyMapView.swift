//
//  PropertyMapView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI
import MapKit

struct PropertyMapView: View {
    var properties: [Property]

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.0, longitude: -95.0),
        span: MKCoordinateSpan(latitudeDelta: 25.0, longitudeDelta: 25.0)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: properties) { property in
            MapPin(coordinate: CLLocationCoordinate2D(latitude: property.latitude, longitude: property.longitude))
        }
        .edgesIgnoringSafeArea(.all)
    }
}
