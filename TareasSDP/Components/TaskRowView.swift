//
//  TaskRowView.swift
//  TareasSDP
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 8/1/26.
//

import SwiftUI

struct TaskRowView: View {
    @Environment(TaskViewModel.self) private var taskViewModel
    let task: Task
    
    @State private var taskExpanded = false
    @State private var showAddTask = false
    @State private var taskInfo = ""
    @State private var selectedTask: Task?
    
    var body: some View {
        VStack {
            DisclosureGroup(task.title, isExpanded: $taskExpanded) {
                if !task.task.isEmpty {
                    ForEach(task.task) { item in
                        HStack {
                            CheckBoxView(isCompleted: item.isCompleted) {
                                item.isCompleted.toggle()
                            }
                            Text(item.titleTask)
                                .font(.body)
                            Spacer()
                        }
                        .padding(.leading, 20)
                    }
                }
                Button {
                    selectedTask = task
                    showAddTask.toggle()
                } label: {
                    Label("Add task", systemImage: "plus.circle.fill")
                        .foregroundStyle(.yellow)
                        .font(.footnote)
                }
                .buttonStyle(.plain)
            }
            .font(.title3)
            .fontWeight(.semibold)
        }
        .addTaskAlert(
            isPresented: $showAddTask,
            text: $taskInfo,
            title: "New Task",
            message: "Enter the task"
        ) { title in
            taskViewModel.addSubtask(selectedTask: selectedTask, task: title)
        }
    }
}

#Preview {
    TaskRowView(task: Task(title: "Hola", task: []))
        .environment(TaskViewModel())
}
