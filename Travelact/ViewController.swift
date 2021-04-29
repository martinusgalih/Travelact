//
//  ViewController.swift
//  Travelact
//
//  Created by Martinus Galih Widananto on 26/04/21.
//
import AVFoundation
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var bgPlane: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var startButton1: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locLabel: UILabel!
    @IBAction func startButton(_ sender: Any) {
       
        //logika next
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
    
    
    //nextButton
    @IBAction func nextButton(_ sender: Any) {
        if bgImage.image == UIImage(named: "Beach") {
            titleLabel.text = "Coming Soon"
            locLabel.text = "Coming Soon"
            bgImage.image = UIImage(named: "comingsoon")
            pageControl.currentPage = 2
            self.clickSound()
        } else if bgImage.image == UIImage(named: "comingsoon") {
            titleLabel.text = "Hive Beach Cafe"
            locLabel.text = "England"
            bgImage.image = UIImage(named: "Beach")
            pageControl.currentPage = 0
            self.clickSound()
        }
    }
    
    //backButton
    @IBAction func backButton(_ sender: Any) {
        if bgImage.image == UIImage(named: "comingsoon") {
            titleLabel.text = "Hive Beach Cafe"
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
    //pageviewcontroller
    var destination: [String] = ["Beach","comingsoon","comingsoon"]
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call the 'keyboardWillShow' function when the view controller receive the notification that a keyboard is going to be shown
            NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          
              // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
            NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        pageControl.numberOfPages = 2
        UISetup()
        
        //play multiple sound
        let sound = Bundle.main.path(forResource: "Backsound", ofType: "wav")
        do {
            audioPlayer1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch {
            print("Eror")
        }
        audioPlayer1.play()
        
        
        
        inputName.delegate = self
        
        do {
            try audioSession.setActive(true)
            volume = audioSession.outputVolume
        } catch {
            print("Error Setting Up Audio Session")
        }
        //dismiss keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        
        //input on keyboard
       
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
        self.view.frame.origin.y = 0 - 120
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
    }
    
    //dismiss keyboard
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
        titleLabel.text = "Hive Beach Cafe"
    }
    
    let vol = AVAudioSession.sharedInstance().outputVolume
    let audioSession = AVAudioSession.sharedInstance()
    var volume: Float?
    
    
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if bgImage.image == UIImage(named: "Beach") && inputName.text != "" {
            audioPlayer1.stop()
            return true
    
        }  else {
             return false
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let secondController = segue.destination as! ConversationViewController
            secondController.namaInput = inputName.text ?? ""
        
        }
}
