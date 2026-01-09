//
//  CheckBoxView.swift
//  TareasSDP
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 8/1/26.
//

import SwiftUI

struct CheckBoxView: View {
    let isCompleted: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isCompleted
                  ? "checkmark.square.fill"
                  : "square")
            .foregroundStyle(isCompleted ? .green : .secondary)
            .font(.title3)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CheckBoxView(isCompleted: true, action: { })
}
