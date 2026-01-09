//
//  AddTaskAlertModifier.swift
//  TareasSDP
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 8/1/26.
//

import Foundation
import SwiftUI

struct AddTaskAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    @Binding var text: String
    let title: String
    let message: String
    let onAdd: (String) -> Void

    func body(content: Content) -> some View {
        content
            .alert(title, isPresented: $isPresented) {
                TextField("Task title", text: $text)

                Button("Cancel", role: .cancel) {
                    text = ""
                }

                Button("Add") {
                    onAdd(text)
                    text = ""
                }
            } message: {
                Text(message)
            }
    }
}

extension View {
    func addTaskAlert(
        isPresented: Binding<Bool>,
        text: Binding<String>,
        title: String,
        message: String,
        onAdd: @escaping (String) -> Void
    ) -> some View {
        modifier(
            AddTaskAlertModifier(
                isPresented: isPresented,
                text: text,
                title: title,
                message: message,
                onAdd: onAdd
            )
        )
    }
}
