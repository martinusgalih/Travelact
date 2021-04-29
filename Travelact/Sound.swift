//
//  sound.swift
//  Travelact
//
//  Created by Martinus Galih Widananto on 27/04/21.
//

import UIKit
import AVFoundation

var soundURI: URL?
var audioPlayer = AVAudioPlayer()
var bgSoundURI: URL?
var bgAudioPlayer = AVAudioPlayer()
var audioPlayer1 = AVAudioPlayer()

extension UIViewController {
    func playSound(file: String, fileExtension: String, isLoop: Bool = false){
        soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = soundURI else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer.play()
        } catch {
            print("something went wrong")
        }
    }
    
    func stopSound(file: String, fileExtension: String, isLoop: Bool = false){
        soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = soundURI else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer.stop()
        } catch {
            print("something went wrong")
        }
    }

    func clickSound() {
    self.playSound(file: "clickSound", fileExtension: "mp3")
    }
    
    func beachSound() {
    self.playSound(file: "beachsoundocean", fileExtension: "wav")
    }
}
