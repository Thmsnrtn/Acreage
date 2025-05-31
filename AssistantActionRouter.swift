//
//  AssistantActionRouter.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class AssistantActionRouter {
    static let shared = AssistantActionRouter()

    func route(command: ParsedCommand) -> String {
        let decision = AssistantExecutionEngine.shared.execute(command)
        AssistantMemoryEngine.shared.record(action: "Executed", context: decision)
        return decision
    }

    func run(commandText: String) -> String {
        let parsed = AssistantCommandInterpreter().interpret(command: commandText)
        return route(command: parsed)
    }
}
