//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by zhoujie on 2023/6/16.
//

import SwiftUI
import CoreData

struct CDTopMenu: View {
    @Binding var showNewTask: Bool
    var body: some View {
        HStack {
            Text("待办事项")
                .font(.system(size: 40, weight: .black))
            Spacer()
            Button {
                self.showNewTask = true
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct NoDataView: View {
    var body: some View {
        Image(uiImage: UIImage(named: "8697cf1ely8gashxj3b09j20u00u040v.jpg")!)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}

struct ToDoListView: View {
    @Binding var todoItems: [ToDoItem]
    var body: some View {
        List {
            ForEach(todoItems) { item in
                ToDoListCell(todoItem: item)
            }
        }
    }
}

struct ToDoListCell: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var todoItem: ToDoItem
    var body: some View {
        Toggle(isOn: self.$todoItem.isCompleted) {
            HStack {
                Text(self.todoItem.name)
                    .strikethrough(self.todoItem.isCompleted, color: .black)
                    .bold()
                    .animation(.default)
                Spacer()
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(self.color(for: self.todoItem.priority))
            }
        }
        .toggleStyle(CheckBoxStyle())
        .onReceive(todoItem.objectWillChange) {
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        }
    }
    
    private func color(for priority: Priority) -> Color {
        switch priority {
        case .low:
            return .green
        case .normal:
            return .orange
        case .high:
            return .red
        }
    }
}

struct MaskView: View {
    var bgColor: Color = .black
    var opacity: CGFloat = 0.5
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
        .opacity(opacity)
    }
}

struct CoreDataDemo: View {
    
    @Environment(\.managedObjectContext) var viewContext

    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.priorityNum, ascending: false)])
    var todoItems: FetchedResults<ToDoItem>
    
    @State private var showNewTask = false
    @State private var offset: CGFloat = .zero
    
    init() {
//        UITableView.appearance().backgroundColor = .clear
//        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            VStack {
                CDTopMenu(showNewTask: $showNewTask)
                if todoItems.count != 0 {
                    ForEach(todoItems) { item in
                        ToDoListCell(todoItem: item)
                            .padding()
                    }
                    .onDelete(perform: deleteTask(indexSet:))
                }
            }
            if todoItems.count == 0 {
                NoDataView()
            }
            if showNewTask {
                MaskView()
                NewTodoView(name: "", priority: .normal, showNewTask: $showNewTask)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0), value: offset)
            }
        }
    }
    
    private func deleteTask(indexSet: IndexSet) {
        for index in indexSet {
            let itemToDelete = todoItems[index]
            viewContext.delete(itemToDelete)
        }
        DispatchQueue.main.async {
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataDemo()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct CheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .purple : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}
