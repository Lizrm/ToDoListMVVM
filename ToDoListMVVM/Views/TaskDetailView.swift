//
//  TaskDetailView.swift
//  ToDoListApp
//
//

import SwiftUI

struct TaskDetailView: View {
    
    var tarea: Task
    @ObservedObject var viewModel: TaskViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var isEditing: Bool = false
    @State private var editedTitle: String = ""
    
    @State private var showingDeleteAlert: Bool = false
    
    var body: some View {
        
        VStack{
            TextField(tarea.title, text: $editedTitle)
                .font(.body)
                .fontWeight(.bold)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
                .padding()
                .navigationTitle("Edit Task").font(.body)
            
            Button("Save") {
                let trimmedTitle = editedTitle.trimmingCharacters(in: .whitespaces)
                if !trimmedTitle.isEmpty {
                    viewModel.updateTask(task: tarea, title: editedTitle)
                    dismiss()
                }
            }.padding(6)
                .background(.green)
                .fontWeight(.bold)
                .cornerRadius(5)
                .frame(width: 500, height: 40)
                .disabled(editedTitle.trimmingCharacters(in: .whitespaces).isEmpty)
        }
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(tarea: Task(title: "Sample task", isComplete: false), viewModel: TaskViewModel())
    }
}

