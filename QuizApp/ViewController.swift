//
//  ViewController.swift
//  QuizApp
//
//  Created by Takumi Fuzawa on 2021/03/03.
//

import UIKit

class ViewController: UIViewController {
    
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpContent()
        //グラデーション
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2)
        gradientLayer.colors = [colors.blueGreen.cgColor, colors.green.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //UILabelの作成
        let lable = UILabel()
        lable.text = "てきとうクイズ"
        lable.textColor = .white
        lable.frame = CGRect(x: 35, y: 140, width: 300, height: 50)
        lable.font = UIFont.systemFont(ofSize: 45, weight: .heavy)
        self.view.addSubview(lable)
        
        //buttonの設定
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(colors.blue, for: .normal)
        button.frame = CGRect(x: 85, y: 635, width: 200, height: 60)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        button.addTarget(self, action: #selector(tapActionButton), for: .touchDown)
        self.view.addSubview(button)
        
    }
    
    //buttonを押したときのアクション
    @objc func tapActionButton() {
        performSegue(withIdentifier: "goStart", sender: nil)
    }
    
    //viewのセットアップ
    func setUpContent() {
        
        let contentView = UIView()
        contentView.frame.size = CGSize(width: view.frame.size.width, height: 340)
        contentView.center = CGPoint(x: view.center.x, y: view.center.y)
        contentView.backgroundColor = .white
        contentView.layer.shadowOffset = CGSize(width: 2, height: 2)
        contentView.layer.cornerRadius = 30
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowColor = UIColor.gray.cgColor
        view.addSubview(contentView)
        
        view.backgroundColor = .systemGray5
        
        //imageの作成
        let imageView = UIImageView()
        let image = UIImage(named: "quiz")
        imageView.image = image
        imageView.frame = CGRect(x: 75, y: 70, width: 220, height: 200)
        contentView.addSubview(imageView)
        
    }


}

