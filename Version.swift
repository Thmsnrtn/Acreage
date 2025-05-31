//
//  Version.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

struct VersionInfo: Codable {
    var currentVersion: String
    var buildDate: Date
}

class VersionManager: ObservableObject {
    static let shared = VersionManager()

    @Published var versionInfo: VersionInfo

    private init() {
        self.versionInfo = VersionInfo(currentVersion: "v120", buildDate: Date())
    }

    func upgrade(to newVersion: String) {
        versionInfo = VersionInfo(currentVersion: newVersion, buildDate: Date())
    }
}
