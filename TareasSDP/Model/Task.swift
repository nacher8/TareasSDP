//
//  Task.swift
//  TareasSDP
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 8/1/26.
//

import Foundation
import SwiftData

@Model
final class Task: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    @Relationship(deleteRule: .cascade) var task: [TaskInfo] = []
    
    init(title: String, task: [TaskInfo] = []) {
        self.title = title
        self.task = task
    }
}

@Model
final class TaskInfo: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var titleTask: String
    var isCompleted: Bool
    
    init(titleTask: String, isCompleted: Bool = false) {
        self.titleTask = titleTask
        self.isCompleted = isCompleted
    }
}
