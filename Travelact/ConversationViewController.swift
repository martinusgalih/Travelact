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
        //replySelection.isHidden = true
        //textLabel.isHidden = true
    }
    
    
    func updateUI(){
        replySelection.layer.cornerRadius = 30
        answer1Button.layer.cornerRadius = 27.5
        answer2Button.layer.cornerRadius = 27.5
        answer3Button.layer.cornerRadius = 27.5
        textLabel.layer.cornerRadius = 20
        textLabel.layer.masksToBounds = true
}

}
