//
//  NewTodoView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/16.
//

import SwiftUI

struct NTDTopMenu: View {
    @Binding var showNewTask: Bool
    var body: some View {
        HStack {
            Text("新建事项")
                .font(.title)
                .bold()
            Spacer()
            Button {
                self.showNewTask = false
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct NTDInputView: View {
    @Binding var name: String
    @Binding var isEditing: Bool
    var body: some View {
        TextField("请输入", text: $name) { editingChanged in
            self.isEditing = editingChanged
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.bottom)
    }
}

struct PrioritySelectView: View {
    @Binding var priority: Priority
    var body: some View {
        HStack {
            PrioritySelectRow(name: "高", color: self.priority == .high ? Color.red : Color(.systemGray4))
                .onTapGesture {
                    self.priority = .high
                }
            PrioritySelectRow(name: "中", color: self.priority == .normal ? Color.orange : Color(.systemGray4))
                .onTapGesture {
                    self.priority = .normal
                }
            PrioritySelectRow(name: "低", color: self.priority == .low ? Color.green : Color(.systemGray4))
                .onTapGesture {
                    self.priority = .low
                }
        }
    }
}

struct PrioritySelectRow: View {
    var name: String
    var color: Color
    var body: some View {
        Text(name)
            .frame(width: 80)
            .font(.system(.headline))
            .padding(10)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
        
    }
}

struct SaveButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @Binding var name: String
    @Binding var showNewTask: Bool
//    @Binding var todoItems: [ToDoItem]
    @Binding var priority: Priority
    var body: some View {
        Button {
            if self.name.trimmingCharacters(in: .whitespaces) == "" {
                return
            }
            self.addTask(name: self.name, priority: self.priority)
            self.showNewTask = false
        } label: {
            Text("保存")
                .font(.system(.headline))
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
        }
        .padding([.top, .bottom])

    }
    
    private func addTask(name: String, priority: Priority, isCompleted: Bool = false) {
        let task = ToDoItem(context: viewContext)
        task.id = UUID()
        task.name = name
        task.priority = priority
        task.isCompleted = isCompleted
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
}

struct NewTodoView: View {
    
    @State var name: String
    @State var isEditing: Bool = false
    @State var priority: Priority
    @Binding var showNewTask: Bool
//    @Binding var todoItems: [ToDoItem]
    var body: some View {
        VStack {
            Spacer()
            VStack {
                NTDTopMenu(showNewTask: $showNewTask)
                NTDInputView(name: $name, isEditing: $isEditing)
                PrioritySelectView(priority: $priority)
                SaveButton(name: $name, showNewTask: $showNewTask, priority: $priority)
            }
            .padding()
            .background(.white)
            .cornerRadius(10, antialiased: true)
            .offset(y: isEditing ? -320 : 0)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(name: "", isEditing: false, priority: .high, showNewTask: .constant(false))
    }
}
