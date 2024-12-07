//
//  TaskViewModel.swift
//  ToDoListApp
//
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    private let notesKey = "notes_key"
    
    init() {
       loadTasks()
    }
  
    func updateTask(task: Task, title: String) {
        if let index = tasks.firstIndex(where: { $0.id == task.id } ) {
            tasks[index].title = title
            tasks[index].isComplete = task.isComplete
        }
        saveTasks()
    }
    func addTask(title: String) {
        let newTask = Task(id: UUID(), title: title, isComplete: false)
        tasks.append(newTask)
        saveTasks()
    }
    
    func deleteTask(at offset: IndexSet) {
        tasks.remove(atOffsets: offset)
        saveTasks()
    }
    
    func toggleTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id } ) {
            tasks[index].isComplete.toggle()
        }
        
    }
    
    private func saveTasks() {
        do {
            let encodedData = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(encodedData, forKey: notesKey)
        } catch {
            print("Error encoding task: \(error)")
        }
    }
     
    private func loadTasks() {
        if let savedData = UserDefaults.standard.data(forKey: notesKey) {
            do {
                tasks = try JSONDecoder().decode([Task].self, from: savedData)
            } catch {
                print("Error decoding task: \(error)")
                tasks = []
            }
        }
    }
}
