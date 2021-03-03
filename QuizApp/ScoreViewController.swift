//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by Takumi Fuzawa on 2021/03/03.
//

import UIKit

class ScoreViewController: UIViewController {
    
    let colors = Colors()
    
    var correct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //グラデーション
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        gradientLayer.colors = [colors.bluePurple.cgColor, colors.blue.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //labelのlayer
        let scoreLabel = UILabel()
        scoreLabel.text = "\(correct)問正解!"
        scoreLabel.textColor = .white
        scoreLabel.frame = CGRect(x: 95, y: 140, width: 300, height: 50)
        scoreLabel.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        self.view.addSubview(scoreLabel)
        
        //buttonの設定
        let button = UIButton(type: .system)
        button.setTitle("トップに戻る", for: .normal)
        button.setTitleColor(colors.white, for: .normal)
        button.frame = CGRect(x: 50, y: 475, width: 275, height: 60)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.addTarget(self, action: #selector(actionButton), for: .touchDown)
        self.view.addSubview(button)
        
    }
    
    //ボタンタップしたらの処理
    @objc func actionButton() {
        //viewControllerに戻る
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    
    
}
