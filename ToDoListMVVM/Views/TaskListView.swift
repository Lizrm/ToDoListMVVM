
import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TaskViewModel
    @State private var taskTitle = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach($viewModel.tasks){ $task in
                        NavigationLink(destination: TaskDetailView(tarea: task, viewModel: viewModel)) {
                            Toggle(task.title,
                                   isOn: $task.isComplete )
                        }
                            .toggleStyle(SwitchToggleStyle(tint: .green))
                            .onChange(of: task.isComplete) {
                                viewModel.toggleTask(task: task)
                            }
                        
                    }.onDelete(perform: viewModel.deleteTask)
                }.navigationTitle("To-Do List")

                EditButton()
                Form {
                    
                    Section(header: Text("Add Task")) {
                        TextField("Title", text: $taskTitle)
                    }
                    Button("Save") {
                        viewModel.addTask(title: taskTitle)
                        taskTitle = ""
                    }.padding(4)
                        .background(.green)
                        .cornerRadius(10)
                        .fontWeight(.bold)
                        .frame(width: 450, height: 40)
                        .disabled(taskTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}
