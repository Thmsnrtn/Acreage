//
//  PrintEngine.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation
import PDFKit

class PrintEngine {
    static func generatePrintJob(for documents: [DocumentTemplate], labels: [MailingLabel]) -> [PDFDocument] {
        var pdfs: [PDFDocument] = []

        for template in documents {
            let pdf = PDFDocument()
            let page = PDFPage()
            let content = template.renderedContent
            let text = NSTextField(labelWithString: content)
            text.frame = NSRect(x: 20, y: 20, width: 500, height: 600)

            let view = NSView(frame: NSRect(x: 0, y: 0, width: 595, height: 842))
            view.addSubview(text)

            let imageRep = view.bitmapImageRepForCachingDisplay(in: view.bounds)!
            view.cacheDisplay(in: view.bounds, to: imageRep)

            let image = NSImage(size: view.bounds.size)
            image.addRepresentation(imageRep)

            page.setValue(image, forKey: "image")
            pdf.insert(page, at: 0)
            pdfs.append(pdf)
        }

        // Mailing labels logic can be handled here or with another page
        return pdfs
    }
}
