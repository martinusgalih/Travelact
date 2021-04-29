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
    @IBOutlet weak var repBut: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var maleC: UIImageView!
    @IBOutlet weak var femaleB: UIImageView!
    @IBOutlet var label: UILabel!
    
    var myString = String()
    
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beachSound()
        
        //play multiple sound
        let sound = Bundle.main.path(forResource: "crowd", ofType: "wav")
        do {
            audioPlayer1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch {
            print("Eror")
        }
        audioPlayer1.play()
        replySelection.layer.shadowColor = UIColor(red: 17/255, green: 113/255, blue: 227/255, alpha: 1.0).cgColor
        replySelection.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        replySelection.layer.shadowOpacity = 1.0
        replySelection.layer.shadowRadius = 0.1
        
        // Do any additional setup after loading the view.
        label.text = myString
        
        updateUI()
        replySelection.isHidden = true
        textLabel.isHidden = true
        
        scene1 = [Convos(text: "Excuse me, would you mind if i seat here?", respons: ["Sorry?", "Sure,Please", "Should you?"], correctRespons: 1, character: "a"), Convos(text: "Thank you, how nice you are. This place is sure crowded isn’t it?", respons: ["Sorry?", "Yes, it's very crowded here", "You think so?, I dont think so"], correctRespons: 1, character: "a"), Convos(text: "By the way, my name is Amy, can I know what’s your name?", respons: ["My name is \(namaInput)", "What's your name?", "Huh?"], correctRespons: 0, character: "a"), Convos(text: "Excuse me, are you ready to order?", respons: ["Oh, I can order", "Hm, I'd like to have fish and chips, please", "Yes, order mine please"], correctRespons: 1, character: "c"), Convos(text: "I would like to have water, what about you? Would you like some?", respons: ["yes please", "I’ll follow you" , "no, thank you"], correctRespons: 1, character: "a"), Convos(text: "How about some Hive's chips or salad or potatoes? They’re very nice snacks", respons: ["Oh no, I have to eat all of it", "Oh No, I can’t handle that much food", "yes please"], correctRespons: 1, character: "c"),Convos(text: "Okay then, so Fish n Chips and a glass of water, is it correct?", respons: ["Yeah it is", "No sorry","So please"], correctRespons: 0, character: "c"), Convos(text: "What about you Madam?", respons: ["","",""], correctRespons: 3, character: "c"), Convos(text: "I’d like to have king prawn, crab sandwich and a cup of tea, by the way are those none dairy food?", respons: ["","",""], correctRespons: 3, character: "a"), Convos(text: "Oh, I’m sorry, crab sandwich contains dairy product. What about fish soup instead, it’s very delicious", respons: ["","",""], correctRespons:3, character: "c"), Convos(text: "Okay, I’ll take that", respons:["","",""], correctRespons: 3, character: "a"), Convos (text: "Okay, wait for a moment", respons: ["","",""], correctRespons: 3, character: "c"), Convos (text: "Um \(namaInput), are you a tourist?", respons: ["Yes, I am", "Pardon me?","I don’t know"], correctRespons: 0, character: "a"), Convos (text: "How many days you’ve been here though?", respons: ["I just arrived here","I’ve been here for about 2 days”, “I will be here until next week"], correctRespons: 1, character: "a"), Convos (text: "I see, you should go to the beach later, it’s very relaxing and fun", respons: ["yeah, I think I’ll go for beach house", "Uh sorry, wait what did you just asked again?","Really? I’ll do that and then go for a canoe tomorrow"], correctRespons: 2, character: "a"), Convos(text: "That’s a good plan", respons: ["Yeah, its a good plant","It's a nice plan","Sure, it a big plant"], correctRespons: 1, character: "a"), Convos (text: "Excuse me, here’s your meals", respons: ["","",""], correctRespons: 3, character: "c"), Convos (text: "Oh, thank you", respons: ["","",""], correctRespons: 3, character: "a"), Convos (text: "You’re welcome Mam", respons: ["","",""], correctRespons: 3, character: "c"), Convos (text: "That’s quite unique bottle you have there, where did you buy it?", respons: ["Boot?","Bottle?", "Pardon me"], correctRespons: 1, character: "a"), Convos (text: "Yes, it looks very cute, where did you buy it?", respons: [" I bought from local e-commerce", "No, it’s not mine", "Oh,,I'ts hand made"], correctRespons: 0, character: "a"), Convos (text: "Oh, I see, I wonder if I can buy it from amazon", respons: ["Can you buy things from river?", "I’m not sure", "What is that?"], correctRespons: 0, character: "a"), Convos (text: "But anyway thank you for letting me know", respons: ["Don't mention it", "I don’t say anything","know what?"], correctRespons: 0, character: "a"), Convos (text: "Can I add your social media platform? I’d like to contact you again someday.", respons: ["sure, here","I don’t have local phone address", "huh?"], correctRespons: 0, character: "a"), Convos (text: "Very pleased to meet you\(namaInput)", respons: ["Pleasure is all mine","Same with me","Never mind"], correctRespons: 0, character: "a") ]
        
        
        
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
        clickSound1()
        let refreshAlert = UIAlertController(title: "Exit", message: "Are you sure want to exit?", preferredStyle: UIAlertController.Style.alert)

                refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
                    
                    let sound = Bundle.main.path(forResource: "Backsound", ofType: "wav")
                    do {
                        audioPlayer1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    }
                    catch {
                        print("Eror")
                    }
                    audioPlayer1.play()
                    self.dismiss(animated: true, completion: nil)
                }))

                refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                      return
                }))

                present(refreshAlert, animated: true, completion: nil)
    }
    
    var namaInput: String = ""
    //nanti nambah
    var scene1:[Convos] = []
    
    
    
    var currentScene: Convos?
    var currentScenePos = 0
    var wrong = 0
    var textSpeak:String = ""
    
    
    
    //to check if the response is correcr
    func checkResponse(index:Int){
        if index == currentScene?.correctRespons{
            let second = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + second){
                self.nextText()
            }
        }else if index != currentScene?.correctRespons{
            setConvos()
        }
        
        if currentScene?.correctRespons == 3{
            let second = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + second){
                self.nextText()
            }
        }
    }
    
    
    //to load next text
    func nextText(){
        if currentScenePos + 1 < scene1.count{
            currentScenePos += 1
            currentScene = scene1[currentScenePos]
            setConvos()
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
        
        
        if currentScene!.correctRespons == 3{
            answer1Button.isHidden = true
            answer3Button.isHidden = true
            answer2Button.setTitle("Next", for: .normal)
        } else if currentScene!.correctRespons != 3{
            answer1Button.isHidden = false
            answer3Button.isHidden = false
        }
        
        
        let second = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + second){
            self.replySelection.isHidden = false
        }
        
        replySelection.isHidden = true
        
    }
    

    
    @IBAction func replayBut(_ sender: Any) {
        setConvos()
        clickSound1()
    }
    
    
    @IBAction func answer1(_ sender: Any) {
        checkResponse(index: 0)
        clickSound1()
        if currentScene!.correctRespons != 0{
            wrong += 1
            answer1Button.backgroundColor = UIColor.systemRed
        }else if currentScene?.correctRespons == 1{
            wrong = 0
        }
        
        if wrong >= 2{
            textLabel.isHidden = false
        }else{
            textLabel.isHidden = true
        }
        
        
        let second = 1.6
        DispatchQueue.main.asyncAfter(deadline: .now() + second){
            self.answer1Button.backgroundColor = UIColor(red: 17/255, green: 113/255, blue: 227/255, alpha: 1.0)
        }
    }
    
    
    @IBAction func answer2(_ sender: Any) {
        checkResponse(index: 1)
        clickSound1()
        if currentScene!.correctRespons != 1{
            wrong += 1
            answer2Button.backgroundColor = UIColor.systemRed
        }else if currentScene?.correctRespons == 1{
            wrong = 0
        }
        
        if wrong >= 2{
            textLabel.isHidden = false
        }else{
            textLabel.isHidden = true
        }
        
        let second = 1.6
        DispatchQueue.main.asyncAfter(deadline: .now() + second){
            self.answer2Button.backgroundColor = UIColor(red: 17/255, green: 113/255, blue: 227/255, alpha: 1.0)
        }
        
    }
    
    
    @IBAction func answer3(_ sender: Any) {
        checkResponse(index: 2)
        clickSound1()
        if currentScene!.correctRespons != 2{
            wrong += 1
            answer3Button.backgroundColor = UIColor.systemRed
        }else if currentScene?.correctRespons == 2{
            wrong = 0
        }
        
        if wrong >= 2{
            textLabel.isHidden = false
        }else{
            textLabel.isHidden = true
        }
        
        let second = 1.6
        DispatchQueue.main.asyncAfter(deadline: .now() + second){
            self.answer3Button.backgroundColor = UIColor(red: 17/255, green: 113/255, blue: 227/255, alpha: 1.0)
        
    }
    
}
}
