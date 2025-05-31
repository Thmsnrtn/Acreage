//
//  UserActivityLog.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class UserActivityLog: ObservableObject {
    @Published var activities: [UserActivity] = []

    func log(_ action: UserActionType, detail: String) {
        let newActivity = UserActivity(timestamp: Date(), action: action, detail: detail)
        activities.insert(newActivity, at: 0)
    }

    func recentActivities(limit: Int = 10) -> [UserActivity] {
        return Array(activities.prefix(limit))
    }
}
