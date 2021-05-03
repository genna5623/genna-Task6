//
//  ViewController.swift
//  kadai6
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var questionLabel: UILabel!
    
    @IBOutlet private weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    private var questionNum: Int = 0

    private func reset(){
        questionNum = Int.random(in: 1...100)
        questionLabel.text = String(questionNum)
        slider.value = 50
    }

    private func resultAlert (message: String) {
        let firstTitle = "結果"
        let alert = UIAlertController(title: firstTitle, message: message, preferredStyle: .alert)
        
        let alertControler = UIAlertAction(
            title: "再挑戦",
            style: .default,
            handler: { [weak self] action in
                self?.reset()
            }
        )
        alert.addAction(alertControler)

        present(alert, animated: true, completion: nil)
    }

    @IBAction func resultButton(_ sender: Any) {
        let sliderNum = Int(slider.value)
        let secondRow: String
        if sliderNum == questionNum {
            secondRow = "あたり！"
        } else {
            secondRow = "はずれ！"
        }
        resultAlert(message: "\(secondRow)\nあなたの値: \(sliderNum)")
    }
}
