//
//  SpatialAnalysis.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation
import CoreLocation

struct SpatialAnalysisResult: Identifiable, Codable {
    var id = UUID()
    var leadID: UUID
    var nearestRoadDistance: Double
    var terrainType: String
    var elevationChange: Double
}
