//
//  Task.swift
//  ToDoListApp
//
//

import Foundation

struct  Task: Codable, Identifiable {
    let id: UUID
    var title: String
    var isComplete: Bool
    
    init(id: UUID = UUID(), title: String, isComplete: Bool) {
            self.id = id
            self.title = title
            self.isComplete = isComplete
        }
}
