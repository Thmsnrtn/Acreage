//
//  ReminderManager.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class ReminderManager: ObservableObject {
    static let shared = ReminderManager()

    @Published var reminders: [Reminder] = []

    func addReminder(_ reminder: Reminder) {
        reminders.append(reminder)
    }

    func removeReminder(_ reminder: Reminder) {
        reminders.removeAll { $0.id == reminder.id }
    }

    func upcomingReminders() -> [Reminder] {
        return reminders.filter { $0.date > Date() }.sorted(by: { $0.date < $1.date })
    }
}

struct Reminder: Identifiable, Codable {
    var id: UUID
    var title: String
    var date: Date
    var notes: String?
}
