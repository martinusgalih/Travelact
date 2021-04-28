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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        updateUI()
        replySelection.isHidden = true
        //textLabel.isHidden = true
        
        currentScene = scene1[0]
        setConvos()
    }
    
    
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
    
    
    //nanti nambah
    var scene1:[Convos] = [Convos(text: "Excuse me, would you mind if i seat here?", respons: ["Sorry?", "Sure", "Should you?"], correctRespons: 1), Convos(text: "Thank you, how nice you are. This place is sure crowded isn’t it?", respons: ["Sorry?", "Yes, it's very crowded here", "You think so?, i dont think so"], correctRespons: 1), Convos(text: "By the way, my name is Amy, can I know what’s your name?", respons: ["My name is", "What's your name?", "Huh?"], correctRespons: 0), Convos(text: "Excuse me, are you ready to order?", respons: ["Oh, I can order", "Hm, I'd like to have fish and chips, please", "Yes, order mine please"], correctRespons: 1)]
    
    var currentScene: Convos?
    var currentScenePos = 0
    var wrong = 0
    
    
    //to check if the response is correcr
    func checkResponse(index:Int){
        if index == currentScene?.correctRespons{
            let second = 3.0
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
        }
    }
    
    
    //to set the label, button, and sound
    func setConvos(){
        textLabel.text = currentScene!.text
        answer1Button.setTitle(currentScene!.respons[0], for: .normal)
        answer2Button.setTitle(currentScene!.respons[1], for: .normal)
        answer3Button.setTitle(currentScene!.respons[2], for: .normal)
        
        let second = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + second){
            self.replySelection.isHidden = false
        }
    }
    
    
    
    @IBAction func answer1(_ sender: Any) {
        checkResponse(index: 0)
        if currentScene!.correctRespons != 0{
            
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


