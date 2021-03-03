//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Takumi Fuzawa on 2021/03/03.
//

import UIKit

class QuizViewController: UIViewController {
    
    let colors = Colors()
    
    @IBOutlet var quizNumberLabel: UILabel!
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var quizButton1: UIButton!
    @IBOutlet var quizButton2: UIButton!
    @IBOutlet var quizButton3: UIButton!
    @IBOutlet var quizButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quizButton1.setTitleColor(colors.blue, for: .normal)
        quizButton2.setTitleColor(colors.blue, for: .normal)
        quizButton3.setTitleColor(colors.blue, for: .normal)
        quizButton4.setTitleColor(colors.blue, for: .normal)
    }
    
    //ボタンアクション
    @IBAction func btnAction(sender: UIButton) {
        
    }
}
