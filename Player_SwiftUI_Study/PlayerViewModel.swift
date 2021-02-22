//
//  PlayerViewModel.swift
//  Player_SwiftUI_Study
//
//  Created by Елизавета Щербакова on 21.02.2021.
//

import Foundation
import AVFoundation

class PlayerViewModel: ObservableObject {
    @Published public var maxDuration = 0.0
    
    @Published public var currentTime = 0.0
    
    public var timer: Timer?
 
    public var player: AVAudioPlayer?
    
    public func play() {
        playSong(name: "Аквадискотека")
        player?.play()
        startTimer()
    }
    
    public func stop() {
        player?.stop()
        timer?.invalidate()
        timer = nil
    }
    
    public func setTime(value: Double) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        currentTime = time
        player?.play()
        
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(selectorTimer), userInfo: nil, repeats: true)
    }
    
    @objc func selectorTimer() {
        currentTime = player?.currentTime ?? 0.0
        if currentTime == maxDuration {
            timer?.invalidate()
            timer = nil
        }
    }
    
    private func playSong(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        } catch {
            print (error.localizedDescription)
        }
    }
}
