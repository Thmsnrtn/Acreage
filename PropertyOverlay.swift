//
//  PropertyOverlay.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI
import MapKit

struct PropertyOverlay: Identifiable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var title: String
    var subtitle: String
}
