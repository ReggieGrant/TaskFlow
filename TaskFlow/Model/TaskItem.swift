//
//  TaskItem.swift
//  TaskFlow
//
//  Created by Reginald Grant on 7/22/26.
//

import Foundation

enum Priority: String, CaseIterable {
    case low, medium, high
}

struct TaskItem: Identifiable, Equatable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var priority: Priority 
}
