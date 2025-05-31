//
//  ReportGenerator.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class ReportGenerator {
    static func generatePortfolioReport(properties: [Property]) -> String {
        var report = "Acreage Portfolio Report\n\n"
        for property in properties {
            report += "APN: \(property.apn)\n"
            report += "Address: \(property.fullAddress)\n"
            report += "Assessed Value: $\(Int(property.assessedValue))\n"
            report += "--------------------------\n"
        }
        return report
    }
}
