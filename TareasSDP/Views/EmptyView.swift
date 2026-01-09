//
//  EmptyView.swift
//  TareasSDP
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 8/1/26.
//

import SwiftUI

struct EmptyView: View {
    @Binding var showAlert: Bool
    var body: some View {
        VStack {
            ContentUnavailableView("No Tasks",
                                   systemImage: "menucard",
                                   description: Text("Without task in this moment, do you want add a new task?"))
            Button {
                showAlert.toggle()
            } label: {
                Text("Add Task")
                    .font(.headline)
                    .padding(.vertical, 10)
            }
            .buttonStyle(.borderedProminent)
            .buttonSizing(.flexible)
            .padding(.horizontal)
        }
    }
}

#Preview {
    @Previewable @State var showAlert: Bool = false
    EmptyView(showAlert: $showAlert)
}
