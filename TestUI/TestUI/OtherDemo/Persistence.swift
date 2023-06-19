//
//  Persistence.swift
//  CoreDataDemo
//
//  Created by zhoujie on 2023/6/16.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let result = PersistenceController.init(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<10 {
            let newItem = ToDoItem(context: viewContext)
            newItem.id = UUID()
            newItem.name = "待办事项\(i)"
            newItem.priority = .normal
            newItem.isCompleted = false
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("111")
        }
        return result
    }()

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TestUI")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
