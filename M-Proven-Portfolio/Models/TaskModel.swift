//
//  TaskModel.swift
//  M-Proven-Portfolio
//
//  Created by Mike-Proven on 9/15/23.
//

import Foundation

// immutable struct, because let not var
struct TaskModel: Identifiable, Codable {
    let id: String
    let task: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, task: String, isCompleted: Bool) {
        self.id = id
        self.task = task
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TaskModel {
        return TaskModel(id: id, task: task, isCompleted: !isCompleted)
    }
}
