//
//  ContentView.swift
//  TareasSDP
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 5/1/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(TaskViewModel.self) private var taskViewModel
    
    @Query private var tasks: [Task]

    @State private var showAlertToTitle = false
    @State private var taskTitle = ""
    @State private var taskInfo = ""
    
    var body: some View {
        NavigationStack {
            if tasks.isEmpty {
                EmptyView(showAlert: $showAlertToTitle)
            } else {
                TaskListView()
                    .navigationTitle("Tareas")
                    .toolbar {
                        ToolbarItemGroup {
                            Button {
                                showAlertToTitle.toggle()
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
            }
        }
        .task {
            taskViewModel.setModelContext(modelContext)
        }
        .addTaskAlert(
            isPresented: $showAlertToTitle,
            text: $taskTitle,
            title: "New Title Task",
            message: "Enter the title for your new tasks"
        ) { title in
            taskViewModel.addTitleTask(title: title)
        }
    }
}

#Preview {
    ContentView()
        .environment(TaskViewModel())
}
