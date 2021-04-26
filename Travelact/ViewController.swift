//
//  ViewController.swift
//  Travelact
//
//  Created by Martinus Galih Widananto on 26/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgPlane: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var inputName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.image = UIImage(named: "Beach")
        bgPlane.layer.cornerRadius = 50
        
    }


}

