//
//  SelectLevelViewController.swift
//  QuizApp
//
//  Created by Takumi Fuzawa on 2021/03/04.
//

import UIKit

class SelectLevelViewController: UIViewController {
    
    let colors = Colors()
    var selectTag = 0
    
    @IBOutlet var selectButton1: UIButton!
    @IBOutlet var selectButton2: UIButton!
    @IBOutlet var selectButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5

        //グラデーション
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2.5)
        gradientLayer.colors = [colors.blueGreen.cgColor, colors.green.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //ラベル
        let selectLabel = UILabel()
        selectLabel.text = "難易度を選択してください。"
        selectLabel.textColor = .white
        selectLabel.frame = CGRect(x: 10, y: 170, width: 370, height: 50)
        selectLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        self.view.addSubview(selectLabel)
        
        //buttonのlayer
        selectButton1.setTitleColor(colors.blue, for: .normal)
        selectButton1.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        
        
        selectButton2.setTitleColor(colors.blue, for: .normal)
        selectButton2.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        
        selectButton3.setTitleColor(colors.blue, for: .normal)
        selectButton3.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        
    }
    
    //画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectlLabel = selectTag
    }
    
    //buttonタップ時の処理
    @IBAction func levelSelectButton(sender: UIButton) {
        print(sender.tag)
        selectTag = sender.tag
        performSegue(withIdentifier: "toQuiz", sender: nil)
    }
    

}
