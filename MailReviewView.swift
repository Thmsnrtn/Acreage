//
//  MailReviewView.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import SwiftUI

struct MailReviewView: View {
    @ObservedObject var mailboxManager: VirtualMailboxManager
    
    var body: some View {
        List(mailboxManager.scannedMail) { item in
            VStack(alignment: .leading) {
                Text("From: \(item.sender)").font(.headline)
                Text("Subject: \(item.subject)").font(.subheadline)
                Text("Received: \(item.receivedDate.formatted())").font(.caption)
                Text("Content: \(item.content)").padding(.top, 4)
            }
            .padding()
        }
        .navigationTitle("Scanned Mail")
    }
}
