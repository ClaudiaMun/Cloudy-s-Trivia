//
//  ViewController.swift
//  Cloudy's Trivia
//
//  Created by Claudia Munoz on 5/3/23.
//
//menu screen, game screen, answer object, question object
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    
    @IBAction func startTrivia(){
    let vc = storyboard?.instantiateViewController(identifier: "trivia") as! TriviaViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
  


}

