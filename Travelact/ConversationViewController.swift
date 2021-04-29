//
//  ConversationViewController.swift
//  Travelact
//
//  Created by Tasya Chandra on 26/04/21.
//

import UIKit
import AVFoundation

class ConversationViewController: UIViewController {
    
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var replySelection: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var maleC: UIImageView!
    @IBOutlet weak var femaleB: UIImageView!
    @IBOutlet var label: UILabel!
    
    var myString = String()
    
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = myString
        
        updateUI()
        replySelection.isHidden = true
        //textLabel.isHidden = true
        
        scene1 = [Convos(text: "Excuse me, would you mind if i seat here?", respons: ["Sorry?", "Sure,Please", "Should you?"], correctRespons: 1, character: "a"), Convos(text: "Thank you, how nice you are. This place is sure crowded isn’t it?", respons: ["Sorry?", "Yes, it's very crowded here", "You think so?, I dont think so"], correctRespons: 1, character: "a"), Convos(text: "By the way, my name is Amy, can I know what’s your name?", respons: ["My name is \(namaInput)", "What's your name?", "Huh?"], correctRespons: 0, character: "a"), Convos(text: "Excuse me, are you ready to order?", respons: ["Oh, I can order", "Hm, I'd like to have fish and chips, please", "Yes, order mine please"], correctRespons: 1, character: "c"), Convos(text: "I would like to have water, what about you? Would you like some?", respons: ["yes please", "I’ll follow you" , "no, thank you"], correctRespons: 1, character: "a"), Convos(text: "How about some Hive's chips or salad or potatoes? They’re very nice snacks", respons: ["Oh no, I have to eat all of it", "Oh No, I can’t handle that much food", "yes please"], correctRespons: 2, character: "b"),Convos(text: "Okay then, so Fish n Chips and a glass of water, is it correct?", respons: ["Yeah it is", "No sorry","So please"], correctRespons: 1, character: "b"), Convos(text: "What about you Madam?", respons: [" I’d like to have king prawn, crab sandwich and a cup of tea, by the way are those none dairy food?"], correctRespons: 0, character: "c"), Convos(text: "Oh, I’m sorry, crab sandwich contains dairy product. What about fish soup instead, it’s very delicious", respons: [""], correctRespons:0, character: "c"), Convos(text: "Okay, I’ll take that", respons:[""], correctRespons: 0, character: "a"), Convos (text: "Okay, wait for a moment", respons: [""], correctRespons: 0, character: "c"), Convos (text: "Um \(namaInput), are you a tourist?", respons: ["Yes, I am", "Pardon me?","I don’t know"], correctRespons: 0, character: "b"), Convos (text: "How many days you’ve been here though?", respons: ["I just arrived here","I’ve been here for about 2 days”, “I will be here until next week"], correctRespons: 1, character: "b") ]
        
        
        currentScene = scene1[0]
        setConvos()
    }
    
    //voicespeaker
    
    
    func updateUI(){
        replySelection.layer.cornerRadius = 30
        answer1Button.layer.cornerRadius = 27.5
        answer2Button.layer.cornerRadius = 27.5
        answer3Button.layer.cornerRadius = 27.5
        textLabel.layer.cornerRadius = 20
        textLabel.layer.masksToBounds = true
}

    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var namaInput: String = ""
    //nanti nambah
    var scene1:[Convos] = []
    
    
    
    var currentScene: Convos?
    var currentScenePos = 0
    var wrong = 0
    var textSpeak:String = ""
    
    
//    func progressConvo() {
//        if currentScenePos == 0 {
//            textSpeak = currentScene!.text
//
//        }
//    }
    
    //to check if the response is correcr
    func checkResponse(index:Int){
        if index == currentScene?.correctRespons{
            let second = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + second){
                self.nextText()
            }
        } else{
            
        }
    }
    
    
    //to load next text
    func nextText(){
        if currentScenePos + 1 < scene1.count{
            currentScenePos += 1
            currentScene = scene1[currentScenePos]
            setConvos()
//        }else if currentScenePos + 1 < scene2.count{
//            currentScenePos += 1
//            currentScene = scene1[currentScenePos]
//            setConvos()
            
        }
    }
    
    
    //to set the label, button, and sound
    func setConvos(){
        textLabel.text = currentScene!.text
        answer1Button.setTitle(currentScene!.respons[0], for: .normal)
        answer2Button.setTitle(currentScene!.respons[1], for: .normal)
        answer3Button.setTitle(currentScene!.respons[2], for: .normal)
        
    
        if currentScene!.character == "a"{
            let utterance = AVSpeechUtterance(string: currentScene!.text)
            utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.siri_female_en-GB_compact")
            utterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2.0
            synthesizer.speak(utterance)
            femaleB.image = UIImage(named: "Female-A")
            maleC.image = UIImage(named: "")

        } else if currentScene!.character == "c"{
            let utterance = AVSpeechUtterance(string: currentScene!.text)
            utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Daniel-compact")
            utterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2.0
            synthesizer.speak(utterance)
            maleC.image = UIImage(named: "Male-C")
            femaleB.image = UIImage(named: "")
        }
        
        
        let second = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + second){
            self.replySelection.isHidden = false
        }
        
        replySelection.isHidden = true
    }
    
//    func replayWrng(){
//
//    }
    
    @IBAction func replayBut(_ sender: Any) {
        setConvos()
    }
    
    @IBAction func answer1(_ sender: Any) {
        checkResponse(index: 0)
        if currentScene!.correctRespons != 1{
            
        }
    }
    
    
    @IBAction func answer2(_ sender: Any) {
        checkResponse(index: 1)
        if currentScene!.correctRespons != 1{
            
        }
    }
    
    
    @IBAction func answer3(_ sender: Any) {
        checkResponse(index: 2)
        if currentScene!.correctRespons != 1{
            
        }
    }
    
}


