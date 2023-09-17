//
//  TaskRow.swift
//  M-Proven-Portfolio
//
//  Created by Mike-Proven on 9/15/23.
//

import SwiftUI

struct TaskRow: View {
    let task: TaskModel
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? .green : .red)
            Text(task.task)
                .foregroundColor(task.isCompleted ? .green : .red)
            Spacer()
        }
        .font(.title2)
        .fontWeight(.semibold)
        .padding(.vertical, 12)
        .background(Color.white)
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var task1 = TaskModel(task: "First", isCompleted: true)
    static var task2 = TaskModel(task: "2nd", isCompleted: false)
    
    static var previews: some View {
        Group {
            TaskRow(task: task1)
            TaskRow(task: task2)
        }
        .previewLayout(.sizeThatFits)
    }
}
