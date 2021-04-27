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

    func clickSound() {
    self.playSound(file: "clickSound", fileExtension: "mp3")
    }
//    func playBgSound(){
//        bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: "PLAYFUL", ofType: "mp3")!)
//        do {
//            guard let uri = bgSoundURI else {return}
//            bgAudioPlayer = try AVAudioPlayer(contentsOf: uri)
//            bgAudioPlayer.numberOfLoops = -1
//            bgAudioPlayer.play()
//        } catch {
//            print("something went wrong")
//        }
//    }
}
