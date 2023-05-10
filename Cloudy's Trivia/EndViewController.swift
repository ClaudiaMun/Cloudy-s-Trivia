//
//  EndViewController.swift
//  Cloudy's Trivia
//
//  Created by Claudia Munoz on 5/10/23.
//

import UIKit

class EndViewController: UIViewController {
    
    
    @IBAction func againTrivia(){
    let vc = storyboard?.instantiateViewController(identifier: "trivia") as! TriviaViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    @IBOutlet weak var endLabel: UILabel!
    
    @IBOutlet weak var endImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
