//
//  PDFExporter.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation
import PDFKit
import SwiftUI

class PDFExporter {
    static func export(content: String, fileName: String) -> URL? {
        let pdfMetaData = [
            kCGPDFContextCreator: "Acreage Executive AI",
            kCGPDFContextAuthor: "AI Assistant"
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]

        let pageWidth = 612.0
        let pageHeight = 792.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)

        let data = renderer.pdfData { context in
            context.beginPage()
            let textRect = CGRect(x: 20, y: 20, width: pageWidth - 40, height: pageHeight - 40)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left

            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 12),
                .paragraphStyle: paragraphStyle
            ]

            content.draw(in: textRect, withAttributes: attrs)
        }

        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("\(fileName).pdf")
        do {
            try data.write(to: tempURL)
            return tempURL
        } catch {
            print("Failed to write PDF: \(error)")
            return nil
        }
    }
}
