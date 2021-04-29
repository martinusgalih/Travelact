//
//  Sound1.swift
//  Travelact
//
//  Created by Martinus Galih Widananto on 29/04/21.
//

import UIKit
import AVFoundation


extension UIViewController {
    
    func playSound1(file: String, fileExtension: String, isLoop: Bool = false){
        soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = soundURI else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer.play()
        } catch {
            print("something went wrong")
        }
    }
    
    func stopSound1(file: String, fileExtension: String, isLoop: Bool = false){
        soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = soundURI else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer.stop()
        } catch {
            print("something went wrong")
        }
    }

    func clickSound1() {
    self.playSound(file: "clickSound", fileExtension: "mp3")
    }
    
    func bgSound1() {
    self.playSound(file: "Backsound", fileExtension: "wav")
    }
    
    func bgSoundStop1() {
        self.stopSound(file: "Backsound", fileExtension: "wav")
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
