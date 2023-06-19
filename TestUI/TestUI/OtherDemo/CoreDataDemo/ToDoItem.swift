//
//  ToDoItem.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/16.
//

import SwiftUI
import CoreData

enum Priority: Int {
    case low = 0
    case normal = 1
    case high = 2
}

public class ToDoItem: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var priorityNum: Int32
    @NSManaged public var isCompleted: Bool
}

extension ToDoItem: Identifiable {
    var priority: Priority {
        get {
            return Priority(rawValue: Int(priorityNum)) ?? .normal
        }
        set {
            self.priorityNum = Int32(newValue.rawValue)
        }
    }
}

