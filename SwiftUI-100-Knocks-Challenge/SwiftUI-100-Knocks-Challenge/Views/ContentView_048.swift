//
//  ContentView_046.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/31.
//

import SwiftUI

/// 簡易 TODO アプリを作成する(追加と削除機能)
struct ContentView_048: ViewWithTitle {
    let title: String = "048: 簡易 TODO アプリを作成する"
    @State private var todos = ["Study", "Work", "Buy"]
    @State private var isAdding = false

    var body: some View {
        VStack {
            List {
                ForEach(todos, id: \.self) { todo in
                    Text(todo)
                }
                .onDelete(perform: delete)
            }
            Spacer()
        }
        .overlay(
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button("Add") {
                        isAdding = true
                    }
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 80, height: 80)
                    .background(.orange)
                    .clipShape(Circle())
                    .padding()
                }
                .padding()
            }
        )
        .ignoresSafeArea(edges: .bottom)
        .toolbar {
            EditButton()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $isAdding) {
            ContentView_048_AddTodoView(todos: $todos)
        }
    }

    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }

    struct ContentView_048_AddTodoView: View {
        @Binding var todos: [String]
        @State private var inputText = ""
        @Environment(\.dismiss) var dismiss

        var body: some View {
            VStack(spacing: 20) {
                TextField("Input Your TODO", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Add") {
                    todos.append(inputText)
                    dismiss()
                }
            }
        }
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
