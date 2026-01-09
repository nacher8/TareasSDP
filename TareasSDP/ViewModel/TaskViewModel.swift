//
//  TaskViewModel.swift
//  TareasSDP
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 8/1/26.
//

import Foundation
import SwiftData

@Observable
final class TaskViewModel {
    private var modelContext: ModelContext?
    
    func setModelContext(_ context: ModelContext) {
        modelContext = context
    }
    
    public func addTitleTask(title: String) {
        guard !title.isEmpty, let context = modelContext else { return }
        
        let newTask = Task(title: title, task: [])
        context.insert(newTask)
        try? context.save()
    }
    
    public func deleteTask(task: Task) {
        guard let context = modelContext else { return }

        context.delete(task)
        try? context.save()
    }
    
    public func addSubtask(selectedTask: Task?, task: String) {
        guard !task.isEmpty,
              let selectedTask,
              let context = modelContext else {
            return
        }
        
        let newTaskInfo = TaskInfo(
            titleTask: task,
            isCompleted: false
        )
        
        selectedTask.task.append(newTaskInfo)
        
        try? context.save()
    }
    
    public func tasksCount() -> Int {
        guard let context = modelContext else { return 0}
        
        let fecth = FetchDescriptor<Task>()
        return (try? context.fetchCount(fecth)) ?? 0
    }
}
