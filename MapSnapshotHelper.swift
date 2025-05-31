//
//  MapSnapshotHelper.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//
import Foundation
import MapKit
import SwiftUI

class MapSnapshotHelper {
    static func takeSnapshot(of coordinate: CLLocationCoordinate2D, size: CGSize, completion: @escaping (UIImage?) -> Void) {
        let options = MKMapSnapshotter.Options()
        options.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        options.size = size
        options.scale = UIScreen.main.scale

        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.start { snapshot, error in
            guard let snapshot = snapshot else {
                completion(nil)
                return
            }

            UIGraphicsBeginImageContextWithOptions(options.size, true, 0)
            snapshot.image.draw(at: .zero)

            let pin = MKPinAnnotationView(annotation: nil, reuseIdentifier: nil)
            let pinImage = pin.image

            var point = snapshot.point(for: coordinate)
            let pinCenterOffset = pin.centerOffset
            point.x -= pin.bounds.size.width / 2
            point.y -= pin.bounds.size.height / 2
            point.x += pinCenterOffset.x
            point.y += pinCenterOffset.y

            pinImage?.draw(at: point)

            let finalImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            completion(finalImage)
        }
    }
}
