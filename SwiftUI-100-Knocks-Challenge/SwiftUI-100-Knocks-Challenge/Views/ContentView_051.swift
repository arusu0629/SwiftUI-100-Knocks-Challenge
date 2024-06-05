//
//  ContentView_051.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/05.
//

import SwiftUI

/// BMIを計算し、結果を別の View で表示する
struct ContentView_051: ViewWithTitle {
    let title: String = "051: BMIを計算し、結果を別の View で表示する"
    @State private var height = ""
    @State private var weight = ""
    @State private var showingSheet = false
    @State private var bmi: BMI = .normal(bmi: 0)

    var body: some View {
        VStack(spacing: 5) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Height")
                TextField("Input Your Height(cm)", text: $height)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            .padding()

            VStack(alignment: .leading, spacing: 10) {
                Text("Weight")
                TextField("Input Your Weight(kg)", text: $weight)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            .padding()

            Button("Calc BMI") {
                guard let height = Double(self.height),
                      let weight = Double(self.weight) else {
                    print("Invalid input text")
                    return
                }
                bmi = BMI.calcBMI(height: height, weight: weight)
                showingSheet = true
            }
            .frame(width: 120, height: 60)
            .background(.gray)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .sheet(isPresented: $showingSheet) {
            ContentView_051_bmiResultView(bmi: $bmi)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    struct ContentView_051_bmiResultView: View {
        @Binding var bmi: ContentView_051.BMI

        var body: some View {
            VStack {
                Text(bmi.description)
            }
        }
    }

    enum BMI {
        /// 痩せ型
        case skinny(bmi: Double)
        /// 普通体重
        case normal(bmi: Double)
        /// 肥満(1度)
        case obesity_1(bmi: Double)
        /// 肥満(2度)
        case obesity_2(bmi: Double)
        /// 肥満(3度)
        case obesity_3(bmi: Double)
        /// 肥満(4度)
        case obesity_4(bmi: Double)

        static func calcBMI(height: Double, weight: Double) -> Self {
            /// BMI = 体重(kg) / 身長(m)^2
            /// 少数第2位切り捨てにする
            let bmi = (weight / pow(height / 100, 2)).truncated(toPlaces: 2)
            switch bmi {
            case 0..<18.5:
                return .skinny(bmi: bmi)
            case 18.5..<25.0:
                return .normal(bmi: bmi)
            case 25.0..<30.0:
                return .obesity_1(bmi: bmi)
            case 30.0..<35.0:
                return .obesity_2(bmi: bmi)
            case 35.0..<40.0:
                return .obesity_3(bmi: bmi)
            default:
                return .obesity_4(bmi: bmi)
            }
        }

        var description: String {
            switch self {
            case .skinny(let bmi):
                return "あなたの BMI は \(bmi) で痩せ型です"
            case .normal(let bmi):
                return "あなたの BMI は \(bmi) で普通体重です"
            case .obesity_1(let bmi):
                return "あなたの BMI は \(bmi) で肥満(1度)です"
            case .obesity_2(let bmi):
                return "あなたの BMI は \(bmi) で肥満(2度)です"
            case .obesity_3(let bmi):
                return "あなたの BMI は \(bmi) で肥満(3度)です"
            case .obesity_4(let bmi):
                return "あなたの BMI は \(bmi) で肥満(4度)です"
            }
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @State var height: String = ""
     @State var weight: String = ""
     @State var bmi: Double = 0
     @State var showingSheet = false

     var body: some View {
         VStack {
             VStack(alignment: .leading) {
                 Text("Height")
                 TextField("Input Your Height", text: $height)
                     .keyboardType(.numberPad)
                     .padding()
                     .border(Color.black, width: 1)
             }
             .padding()

             VStack(alignment: .leading) {
                 Text("Height")
                 TextField("Input Your Weight", text: $weight)
                     .keyboardType(.numberPad)
                     .padding()
                     .border(Color.black, width: 1)
             }
             .padding()

             Button(action: {
                 guard let height = Double(self.height),
                       let weight = Double(self.weight) else {
                     print("Fail to Calc BMI")
                     return
                 }

                 // Calc BMI
                 bmi = weight / (height / 100) / (height / 100)

                 // Show Sheet
                 showingSheet = true
             }, label: {
                 Text("Calc BMI")
                     .font(.title)
                     .foregroundColor(Color.black)
                     .padding()
                     .background(Color(UIColor.lightGray))
                     .cornerRadius(16)
             })
         }
         .sheet(isPresented: $showingSheet) {
             ResultView(bmi: $bmi)
         }
     }
 }

 struct ResultView: View {
     @Binding var bmi: Double
     var body: some View {
         VStack {
             Text("BMI: \(bmi)")

             if bmi < 18.5 {
                 Text("You are thin")
                 Image(.bellsprout)
                     .resizable()
                     .frame(width: 200, height: 200)
             } else if bmi > 25 {
                 Text("You are fat")
                 Image(.snorlax)
                     .resizable()
                     .frame(width: 200, height: 200)
             } else {
                 Text("You are healthy")
                 Image(.pikachu)
                     .resizable()
                     .frame(width: 200, height: 200)
             }
         }
     }
 }

 */

#Preview {
    NavigationStack {
        ContentView_051()
    }
}
