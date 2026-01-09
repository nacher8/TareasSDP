//
//  TareasSDPApp.swift
//  TareasSDP
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 5/1/26.
//

import SwiftUI
import SwiftData

@main
struct TareasSDPApp: App {
    @State private var taskVM = TaskViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(taskVM)
        }
        .modelContainer(for: Task.self)
    }
}
