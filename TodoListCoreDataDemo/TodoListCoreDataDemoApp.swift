//
//  TodoListCoreDataDemoApp.swift
//  TodoListCoreDataDemo
//
//  Created by Thongchai Subsaidee on 2/11/2564 BE.
//

import SwiftUI

@main
struct TodoListCoreDataDemoApp: App {
    
    let persistentContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
