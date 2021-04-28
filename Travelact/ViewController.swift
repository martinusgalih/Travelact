//
//  ViewController.swift
//  Travelact
//
//  Created by Martinus Galih Widananto on 26/04/21.
//
import AVFoundation
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var bgPlane: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var startButton1: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locLabel: UILabel!
    @IBOutlet weak var scrollView: UIPageControl!
    
    
    @IBAction func startButton(_ sender: Any) {
        if bgImage.image == UIImage(named: "Beach") && inputName.text != "" {
           
        } else if bgImage.image == UIImage(named: "Beach") && inputName.text == "" {
            let alertController = UIAlertController(title: "Warning", message:
                    "Please input your name", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self.present(alertController, animated: true, completion: nil)
        } else if bgImage.image == UIImage(named: "comingsoon") && inputName.text != "" {
            let alertController = UIAlertController(title: "Warning", message:
                    "Coming soon", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self.present(alertController, animated: true, completion: nil)
        } else if bgImage.image == UIImage(named: "comingsoon") && inputName.text == "" {
            let alertController = UIAlertController(title: "Warning", message:
                    "Please input your name and choose the story", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if bgImage.image == UIImage(named: "Beach") {
            titleLabel.text = "Coming Soon"
            locLabel.text = "Coming Soon"
            bgImage.image = UIImage(named: "comingsoon")
            pageControl.currentPage = 2
            self.clickSound()
        } else if bgImage.image == UIImage(named: "comingsoon") {
            titleLabel.text = "Hive Five Beach"
            locLabel.text = "England"
            bgImage.image = UIImage(named: "Beach")
            pageControl.currentPage = 0
            self.clickSound()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        if bgImage.image == UIImage(named: "comingsoon") {
            titleLabel.text = "Hive Five Beach"
            locLabel.text = "England"
            bgImage.image = UIImage(named: "Beach")
            pageControl.currentPage = 0
            self.clickSound()
        } else if bgImage.image == UIImage(named: "Beach") {
            titleLabel.text = "Coming Soon"
            locLabel.text = "Coming Soon"
            bgImage.image = UIImage(named: "comingsoon")
            pageControl.currentPage = 2
            self.clickSound()
            print(AVSpeechSynthesisVoice.speechVoices())
        }
    }
    var destination: [String] = ["Beach","comingsoon","comingsoon"]
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = 2
        UISetup()
    }

    //tampilan
    func UISetup() {
        startButton1.layer.cornerRadius = 27.5
        startButton1.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        startButton1.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        startButton1.layer.shadowOpacity = 1.0
        startButton1.layer.shadowRadius = 0.1
        
        inputName.layer.cornerRadius = 17
        inputName.layer.borderWidth = 1
        inputName.layer.borderColor = UIColor.lightGray.cgColor
        
        bgPlane.layer.cornerRadius = 50
        
        bgImage.image = UIImage(named: "Beach")
        locLabel.text = "England"
        titleLabel.text = "Hive Five Beach"
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if bgImage.image == UIImage(named: "Beach") && inputName.text != "" {
            return true
        }  else {
             return false
        }
        
    }
}
