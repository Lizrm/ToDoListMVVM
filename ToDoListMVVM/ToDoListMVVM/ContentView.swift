//
//  ContentView.swift
//  ToDoListMVVM
//
// ContentView.swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskListView(viewModel: TaskViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
