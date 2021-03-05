//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Takumi Fuzawa on 2021/03/03.
//

import UIKit

class QuizViewController: UIViewController {
    
    let colors = Colors()
    
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    var selectlLabel = 0
    
    @IBOutlet var quizNumberLabel: UILabel!
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var quizButton1: UIButton!
    @IBOutlet var quizButton2: UIButton!
    @IBOutlet var quizButton3: UIButton!
    @IBOutlet var quizButton4: UIButton!
    @IBOutlet var judgeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("選択したは難易度\(selectlLabel)")
        
        view.backgroundColor = .systemGray5
        
        //グラデーション
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2)
        gradientLayer.colors = [colors.blueGreen.cgColor, colors.green.cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //labelのlayer
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizNumberLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        
        //問題をシャッフル
        csvArray = loadCSV(fileName: "quiz\(selectlLabel)")
        csvArray.shuffle()
       
        
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        
        quizTextView.text = quizArray[0]
        quizTextView.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        quizButton1.setTitleColor(colors.blue, for: .normal)
        quizButton1.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        quizButton1.setTitle(quizArray[2], for: .normal)
        
        quizButton2.setTitleColor(colors.blue, for: .normal)
        quizButton2.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        quizButton2.setTitle(quizArray[3], for: .normal)
        
        quizButton3.setTitleColor(colors.blue, for: .normal)
        quizButton3.titleLabel?.font = UIFont.systemFont(ofSize:20, weight: .heavy)
        quizButton3.setTitle(quizArray[4], for: .normal)
        
        quizButton4.setTitleColor(colors.blue, for: .normal)
        quizButton4.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        quizButton4.setTitle(quizArray[5], for: .normal)
    }
    
    //値の受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
    }
    
    //nextquiz
    func nextQuiz() {
        
        quizCount += 1
        
        if quizCount < csvArray.count {
    
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            quizNumberLabel.text = "第\(quizCount + 1)問"
            quizTextView.text = quizArray[0]
            
            quizButton1.setTitleColor(colors.blue, for: .normal)
            quizButton1.setTitle(quizArray[2], for: .normal)
            
            quizButton2.setTitleColor(colors.blue, for: .normal)
            quizButton2.setTitle(quizArray[3], for: .normal)
            
            quizButton3.setTitleColor(colors.blue, for: .normal)
            quizButton3.setTitle(quizArray[4], for: .normal)
            
            quizButton4.setTitleColor(colors.blue, for: .normal)
            quizButton4.setTitle(quizArray[5], for: .normal)
            
        } else {
            performSegue(withIdentifier: "goScore", sender: nil)
        }
        
    }
    
    //csvファイルを読み込む
    func loadCSV(fileName: String) -> [String] {
        
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
    }
    
    //ボタンアクション
    @IBAction func btnAction(sender: UIButton) {
        if sender.tag == Int(quizArray[1]) {
            correctCount += 1
            print("正解")
            judgeImageView.image = UIImage(named: "circle")
        } else {
            print("不正解")
            judgeImageView.image = UIImage(named: "unchecked")
        }
        print("スコア : \(correctCount)")
        judgeImageView.isHidden = false
        quizButton1.isEnabled = false
        quizButton2.isEnabled = false
        quizButton3.isEnabled = false
        quizButton4.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.judgeImageView.isHidden = true
            self.quizButton1.isEnabled = true
            self.quizButton2.isEnabled = true
            self.quizButton3.isEnabled = true
            self.quizButton4.isEnabled = true
            self.nextQuiz()
        }
       
    }
}
