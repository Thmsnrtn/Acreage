//
//  PropertyOverlayView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI
import MapKit

struct PropertyOverlayView: View {
    var overlays: [PropertyOverlay]

    var body: some View {
        Map {
            ForEach(overlays) { overlay in
                Annotation(coordinate: overlay.coordinate) {
                    VStack {
                        Text(overlay.title).font(.caption).bold()
                        Text(overlay.subtitle).font(.caption2)
                    }
                }
            }
        }
    }
}
