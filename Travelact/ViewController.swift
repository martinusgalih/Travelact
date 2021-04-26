//
//  ViewController.swift
//  Travelact
//
//  Created by Martinus Galih Widananto on 26/04/21.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var bgPlane: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var startButton1: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "twoScreen", sender: self)
        
    }
    var destination: [String] = ["Beach","comingsoon","comingsoon"]
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = destination.count
        setupScreens()
        scrollView.delegate = self
        UISetup()
        animateView()
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
    }
    
    func setupScreens() {
        for index in 0..<destination.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: destination[index])
            self.scrollView.addSubview(imgView)
            
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(destination.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    func animateView() {
        if (pageControl.subviews.count == 1) {
            titleLabel.text = "Hive Beach Cafe"
            locLabel.text = "England"
            return
        }
        if (pageControl.subviews.count == 2) {
            titleLabel.text = ""
            locLabel.text = ""
            titleLabel.text = "Coming Soon"
            locLabel.text = "Coming Soon"
            return
            
        }

    }
}

