//
//  TaskListView.swift
//  TareasSDP
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 8/1/26.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    @Environment(TaskViewModel.self) private var taskViewModel
    @Query(sort: \Task.title) private var tasks: [Task]

    var body: some View {
        @Bindable var viewModel = taskViewModel
        List {
            ForEach(tasks) { task in
                TaskRowView(task: task)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            taskViewModel.deleteTask(task: task)
                        } label: {
                            Image(systemName: "xmark.bin.fill")
                        }
                        .tint(.red)
                    }
            }
        }
        .listStyle(.automatic)
    }
}

#Preview {
    TaskListView()
        .environment(TaskViewModel())
}
