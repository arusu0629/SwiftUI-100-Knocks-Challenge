//
//  ContentView_049.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/03.
//

import SwiftUI
import AVFoundation

/// SwiftUI で AVAudioPlayer で音楽を再生し、再生終了を検知する
struct ContentView_049: ViewWithTitle {
    let title: String = "049: AVAudioPlayer で音楽を再生し、再生終了を検知する"
    @StateObject private var player = AudioPlayer()

    var body: some View {
        Button("Play") {
            player.playSound(path: "melody")
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }

    final class AudioPlayer: ObservableObject {
        private var audioPlayer: AVAudioPlayer?

        func playSound(path: String, fileExtension: String = "mp3") {
            guard let soundURL = Bundle.main.url(forResource: path, withExtension: fileExtension) else {
                print("Invalid resource path")
                return
            }
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Unable to play sound file: \(error.localizedDescription)")
            }
        }
    }
}

/*
 解答例
 struct ContentView: View {
     @StateObject var viewModel = ContentViewState()
     var body: some View {
         VStack {
             Button("Play") {
                 viewModel.playAudio()
             }
         }
     }
 }

 class ContentViewState: NSObject, ObservableObject {
     var audioPlayer: AVAudioPlayer?

     func playAudio() {
         guard let url = Bundle.main.url(forResource: "melody", withExtension: "mp3") else { return }
         audioPlayer = try? AVAudioPlayer(contentsOf: url)
         audioPlayer?.delegate = self
         audioPlayer?.play()
     }
 }

 extension ContentViewState: AVAudioPlayerDelegate {
     func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
         print("Did finish Playing")
     }
 }

 */

#Preview {
    NavigationStack {
        ContentView_049()
    }
}
