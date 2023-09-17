//
//  TaskView.swift
//  M-Proven-Portfolio
//
//  Created by Mike-Proven on 9/15/23.
//

import SwiftUI

struct TaskView: View {
    @Binding var showPageView: String
    
    // data list for tasks
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
            if taskViewModel.tasks.isEmpty {
                NoTasks()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(taskViewModel.tasks) {item in
                        TaskRow(task: item)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.2)) {
                                    taskViewModel.updateTask(task: item)
                                }
                            }
                    }
                    .onDelete(perform: taskViewModel.deleteTask)
                    .onMove(perform: taskViewModel.moveTask)
                } // end list
                .navigationTitle("Tasks To Do:")
                .navigationBarItems(leading: EditButton(),
                                    trailing:
                                        NavigationLink("Add", destination: AddTaskView())
                )} // end else
            } // end zstack
            .padding(40)
        } // end nav
    } // end body
} // end view struct

struct TaskView_Previews: PreviewProvider {
  // @EnvironmentObject var taskViewModel: TaskViewModel
    static var previews: some View {
        @State var showPageView = ""
        TaskView(showPageView: $showPageView).environmentObject(TaskViewModel())
    }
        
}
