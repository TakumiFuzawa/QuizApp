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
    
    @IBOutlet var quizNumberLabel: UILabel!
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var quizButton1: UIButton!
    @IBOutlet var quizButton2: UIButton!
    @IBOutlet var quizButton3: UIButton!
    @IBOutlet var quizButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景色
        view.backgroundColor = .systemGray5
        
        //labelのlayer
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizNumberLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        
        csvArray = loadCSV(fileName: "quiz")
        print(csvArray)
        
        quizArray = csvArray[quizCount].components(separatedBy: ",")

        quizButton1.setTitleColor(colors.blue, for: .normal)
        quizButton1.setTitle(quizArray[2], for: .normal)
        quizButton2.setTitleColor(colors.blue, for: .normal)
        quizButton2.setTitle(quizArray[3], for: .normal)
        quizButton3.setTitleColor(colors.blue, for: .normal)
        quizButton3.setTitle(quizArray[4], for: .normal)
        quizButton4.setTitleColor(colors.blue, for: .normal)
        quizButton4.setTitle(quizArray[5], for: .normal)
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
        print(sender.tag)
    }
}
