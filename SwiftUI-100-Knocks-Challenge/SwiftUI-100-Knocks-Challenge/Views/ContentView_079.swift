//
//  ContentView_079.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/18.
//

import SwiftUI

/// ObservableObject の @Published なプロパティと Binding する
struct ContentView_079: ViewWithTitle {
    let title: String = "079: ObservableObject の @Published なプロパティと Binding する"
    @State private var count = 0
    @State private var isShowingSheet = false

    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Show Sheet") {
                isShowingSheet = true
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            ContentView_079_AddItemView(count: $count)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_079_AddItemView: View {
        @StateObject var viewModel: CountViewModel

        init(count: Binding<Int>) {
            self._viewModel = StateObject(wrappedValue: CountViewModel(count: count))
        }

        var body: some View {
            VStack {
                Text("Count: \(viewModel.count)")
                Button("Add Item") {
                    viewModel.increment()
                }
            }
        }
    }

    final class CountViewModel: ObservableObject {
        @Binding var bindingCount: Int
        @Published private(set) var count: Int {
            didSet {
                bindingCount = count
            }
        }

        init(count: Binding<Int>) {
            self.count = count.wrappedValue
            self._bindingCount = count
        }

        func increment() {
            count += 1
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var items: [String] = []
     @State var showingSheet: Bool = false

     var body: some View {
         VStack {
             Text("Count: \(items.count)")

             Button {
                 showingSheet = true
             } label: {
                 Text("Show Sheet")
             }
         }
         .sheet(isPresented: $showingSheet) {
             AddItemView(items: $items)
         }
     }
 }

 struct AddItemView: View {
     @StateObject var viewState: AddItemViewState

     init(items: Binding<[String]>) {
         self._viewState = StateObject(wrappedValue: AddItemViewState(items: items))
     }

     var body: some View {
         VStack {
             Text("Count: \(viewState.items.count)")

             Button {
                 viewState.addItem()
             } label: {
                 Text("Add Item")
             }
         }
     }
 }

 class AddItemViewState: ObservableObject {
     @Binding var bindingItems: [String]
     @Published var items: [String] {
         didSet {
             bindingItems = items
         }
     }

     init(items: Binding<[String]>) {
         self.items = items.wrappedValue
         self._bindingItems = items
     }

     func addItem() {
         items.append("Mac Book Pro")
     }
 }
*/

#Preview {
    NavigationStack {
        ContentView_079()
    }
}
