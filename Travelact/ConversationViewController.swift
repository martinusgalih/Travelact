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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        buttonUI()
        //replySelection.isHidden = true
    }
    
    
    func buttonUI(){
        replySelection.layer.cornerRadius = 15
        answer1Button.layer.cornerRadius = 10
        answer2Button.layer.cornerRadius = 10
        answer3Button.layer.cornerRadius = 10
    }
}

