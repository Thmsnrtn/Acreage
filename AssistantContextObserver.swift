//
//  AssistantContextObserver.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class AssistantContextObserver {
    static let shared = AssistantContextObserver()

    private(set) var recentUserActions: [UserAction] = []

    private init() {}

    func register(action: UserAction) {
        recentUserActions.append(action)
        if recentUserActions.count > 50 {
            recentUserActions.removeFirst()
        }
    }

    func lastAction(ofType type: UserActionType) -> UserAction? {
        return recentUserActions.reversed().first { $0.type == type }
    }
}

enum UserActionType: String {
    case taxPaid, propertyViewed, offerSent, fileGenerated, leadContacted
}

struct UserAction {
    let type: UserActionType
    let timestamp: Date
    let metadata: [String: String]
}
