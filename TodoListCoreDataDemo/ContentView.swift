//
//  ContentView.swift
//  TodoListCoreDataDemo
//
//  Created by Thongchai Subsaidee on 2/11/2564 BE.
//

//https://youtu.be/CZ79PpB7HIo

import SwiftUI
import CoreData

enum Priority: String, Identifiable, CaseIterable {
    
    var id: UUID {
        return UUID()
    }
    
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    
}

extension Priority {
    var title: String {
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
}


struct ContentView: View {
    
    @State private var title: String = ""
    @State private var selectedPriority: Priority = .medium
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dataCreated", ascending: false)]) private var allTasks: FetchedResults<Task>
    
    private func saveTask() {
        do{
            let task = Task(context: viewContext)
            task.title = title
            task.priority = selectedPriority.rawValue
            task.createData = Date()
            try viewContext.save()
        }catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
       
        NavigationView {
            VStack {
                TextField("Enter title", text: $title)
                    .textFieldStyle(.roundedBorder)
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(Priority.allCases) { priority in
                        Text(priority.title)
                            .tag(priority)
                    }
                }
                .pickerStyle(.segmented)
                
                Button {
                    saveTask()
                } label: {
                    Text("Save")
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
                List{
                    ForEach(allTasks) { task in
                        Text(task.title ?? "")
                        
                    }
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("All Tasks")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
