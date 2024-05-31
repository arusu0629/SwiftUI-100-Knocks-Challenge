//
//  ContentView_048.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/31.
//

import SwiftUI

/// 簡易 TODO アプリを作成する(追加と削除機能)
struct ContentView_048: ViewWithTitle {
    let title: String = "048: 簡易 TODO アプリを作成する"
    @State private var todos = ["Study", "Work", "Buy"]

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                ForEach(todos, id: \.self) { todo in
                    Text(todo)
                }
                .onDelete(perform: delete)
            }
            .toolbar {
                EditButton()
            }

            NavigationLink(destination: ContentView_048_AddTodoView(delegate: self)) {
                Text("Add")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
            .frame(width: 80, height: 80)
            .background(.orange)
            .clipShape(Circle())
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }

    struct ContentView_048_AddTodoView: View {
        @State private var inputText = ""
        @Environment(\.dismiss) var dismiss
        let delegate: AddTodoDelegate

        var body: some View {
            VStack(spacing: 20) {
                TextField("Input Your TODO", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Add") {
                    delegate.execute(text: inputText)
                    dismiss()
                }
            }
        }
    }
}

protocol AddTodoDelegate {
    func execute(text: String)
}

extension ContentView_048: AddTodoDelegate {

    func execute(text: String) {
        todos.append(text)
    }
}

/*
 解答例
 struct ContentView: View, InputViewDelegate {
     @State var todos: [String] = []

     var body: some View {
         NavigationView {
             ZStack(alignment: .bottomTrailing) {
                 List {
                     ForEach(todos, id: \.self) { user in
                         Text(user)
                     }
                     .onDelete(perform: delete)
                 }
                 .listStyle(.plain)

                 NavigationLink(destination: InputView(delegate: self, text: "")) {
                     Text("Add")
                         .foregroundColor(Color.white)
                         .font(Font.system(size: 20))
                 }
                 .frame(width: 60, height: 60)
                 .background(Color.orange)
                 .cornerRadius(30)
                 .padding()

             }
             .onAppear {
                 if let todos = UserDefaults.standard.array(forKey: "TODO") as? [String] {
                     self.todos = todos
                 }
             }
             .navigationTitle("TODO")
             .navigationBarItems(trailing: EditButton())
         }
     }

     func delete(at offsets: IndexSet) {
         todos.remove(atOffsets: offsets)
         UserDefaults.standard.setValue(todos, forKey: "TODO")
     }

     func addTodo(text: String) {
         todos.append(text)
         UserDefaults.standard.setValue(todos, forKey: "TODO")
     }
 }

 struct InputView: View {
     @Environment(\.presentationMode) var presentation
     let delegate: InputViewDelegate
     @State var text: String

     var body: some View {
         VStack(spacing: 16) {
             TextField("Input Your TODO", text: $text)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
             Button("Add") {
                 delegate.addTodo(text: text)
                 presentation.wrappedValue.dismiss()
             }
         }
         .padding()
     }
 }
 
 */

#Preview {
    NavigationStack {
        ContentView_048()
    }
}
