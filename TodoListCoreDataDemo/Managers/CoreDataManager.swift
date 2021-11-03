//
//  CoreDataManager.swift
//  TodoListCoreDataDemo
//
//  Created by Thongchai Subsaidee on 2/11/2564 BE.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "SimpleTodoModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initalize Core Data \(error)")
            }
        }
        
    }
    
     
}
