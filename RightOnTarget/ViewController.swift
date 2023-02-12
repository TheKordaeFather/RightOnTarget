//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Кордюков Андрей on 12.02.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var currentNumberLabel: UILabel!
    
    
    
    let roundCount:Int = 5
    var currentRound:Int = 1
    var score:Int = 250
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentNumberLabel.text = String(Int.random(in: 1...50))
        
    }
    
    func calculateScore(_ currentNumber:Int) -> Int {
        let calculatedResult = abs(currentNumber - Int(slider.value.rounded()))
        currentRound += 1
        guard currentRound != 6 else {
            currentNumberLabel.text = "End"
            return calculatedResult
        }
        currentNumberLabel.text = String(Int.random(in: 1...50))
        return calculatedResult
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
    }
    
    @IBAction func checkResultButton(_ sender: UIButton) {
        let currentNumber:Int = Int(currentNumberLabel.text!) ?? 0
        score -= calculateScore(currentNumber)
        
        print(currentRound - 1)
        if currentRound == 6 {
            var alertController = UIAlertController(title: "конец игры", message: "у вас \(score) очков", preferredStyle: .alert)
            var alertAction = UIAlertAction(title: "Начать заново", style: .default) { _ in
                self.currentRound = 1
                self.score = 250
                self.currentNumberLabel.text = String(Int.random(in: 1...50))
                self.slider.value = 25
                
            }
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
}

