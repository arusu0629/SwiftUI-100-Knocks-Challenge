//
//  ContentView_027.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/05/17.
//

import SwiftUI

/// 複数行の Picker を作成する
struct ContentView_027: ViewWithTitle {
    let title: String = "027: 複数行の Picker を作成する"
    let evenNumbers = (0..<60).filter { $0.isMultiple(of: 2) }
    let oddNumbers  = (0..<60).filter { !$0.isMultiple(of: 2) }
    @State private var selectedEvenNumber = 0
    @State private var selectedOddNumber = 1

    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 20) {
                    Picker(selection: $selectedEvenNumber, label: Text("even number picker")) {
                        ForEach(evenNumbers, id: \.self) { index in
                            Text("\(index)").tag(index)
                        }
                    }
                    .onReceive([selectedEvenNumber].publisher.first()) { (value) in
                        print("even number: \(value)")
                    }
                    .pickerStyle(.wheel)
                    Text("Selected: \(selectedEvenNumber)")
                }
                VStack {
                    Picker(selection: $selectedOddNumber, label: Text("odd number picker")) {
                        ForEach(oddNumbers, id: \.self) { index in
                            Text("\(index)").tag(index)
                        }
                    }
                    .onReceive([selectedOddNumber].publisher.first()) { (value) in
                        print("odd number: \(value)")
                    }
                    .pickerStyle(.wheel)
                    Text("Selected: \(selectedOddNumber)")
                }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
 解答例
 struct ContentView: View {
     @State var selectedHour = 8
     @State var selectedMinute = 30

     var body: some View {
         GeometryReader { geometry in
             HStack {
                 Picker(selection: $selectedHour, label: EmptyView()) {
                     ForEach(0 ..< 24) {
                         Text("\($0)")
                     }
                 }
                 .pickerStyle(WheelPickerStyle())
                 .onReceive([selectedHour].publisher.first()) { (value) in
                     print("hour: \(value)")
                 }.labelsHidden()
                     .frame(width: geometry.size.width / 2, height: geometry.size.height)
                     .clipped()

                 Picker(selection: $selectedMinute, label: EmptyView()) {
                     ForEach(0 ..< 60) {
                         Text("\($0)")
                     }
                 }
                 .pickerStyle(WheelPickerStyle())
                 .onReceive([selectedMinute].publisher.first()) { value in
                     print("minute: \(value)")
                 }
                 .labelsHidden()
                 .frame(width: geometry.size.width / 2, height: geometry.size.height)
                 .clipped()
             }
         }
         .padding()
     }
 }
 */

#Preview {
    NavigationStack {
        ContentView_027()
    }
}
