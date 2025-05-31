//
//  ParcelMapOverlayView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation
import PDFKit
import SwiftUI

class PDFExportHelper {
    static func export(view: some View, filename: String) {
        let controller = UIHostingController(rootView: view)
        controller.view.bounds = CGRect(x: 0, y: 0, width: 612, height: 792) // standard A4

        let pdfRenderer = UIGraphicsPDFRenderer(bounds: controller.view.bounds)
        let data = pdfRenderer.pdfData { context in
            context.beginPage()
            controller.view.layer.render(in: context.cgContext)
        }

        let url = FileManager.default.temporaryDirectory.appendingPathComponent("\(filename).pdf")
        do {
            try data.write(to: url)
            print("PDF saved to: \(url)")
        } catch {
            print("Failed to write PDF: \(error)")
        }
    }
}
