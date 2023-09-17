//
//  TaskViewModel.swift
//  M-Proven-Portfolio
//
//  Created by Mike-Proven on 9/15/23.
//

import Foundation

// class is better for UserDefaults, using this
// AppStorage is better for in a view???


class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTasks() // saves tasks any time something changes in the array
        }
    }
    let tasksKey: String = "tasks_list"
    
    init() {
        getTasks()
    }
    
    
    func getTasks() {
//        let newTasks = [
//            TaskModel(task: "1st task", isCompleted: true),
//            TaskModel(task: "2nd task", isCompleted: false)
//        ]
//        tasks.append(contentsOf: newTasks)
        guard
            let data = UserDefaults.standard.data(forKey: tasksKey),
            let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        
        self.tasks = savedTasks
    }
    
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    
    func addTask(textAddString: String) {
        let newTask = TaskModel(task: textAddString, isCompleted: false)
        tasks.append(newTask)
    }
    
    
    func updateTask(task: TaskModel) {
        // same as working if below
        /*
        if let index = tasks.firstIndex { (existingTask) -> Bool in
            return existingTask.id == task.id
        } {
            // run this code
        }
        */
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            // not updated in ViewModels, only in the Model
            tasks[index] = task.updateCompletion()   // TaskModel(task: task.task, isCompleted: !task.isCompleted)
        }
    }
    
    
    func saveTasks() {
        // UserDefaults.standard.set()
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
}
