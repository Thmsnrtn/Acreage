//
//  Segment.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct Segment: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var rules: [SegmentRule]
}

struct SegmentRule: Identifiable, Codable {
    var id = UUID()
    var type: String
    var value: String
}
