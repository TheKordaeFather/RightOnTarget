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
    
    var game:GameProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentNumberLabel.text = String(Int.random(in: 1...50))
        game = Game()
    }
    
    func alertControllerPerfomance(){
        let alertController = UIAlertController(title: "конец игры", message: "у вас \(game.score) очков", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Начать заново", style: .default) { [self] _ in
            slider.value = 25
            currentNumberLabel.text = String(Int.random(in: 1...50))
        }        
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func checkResultButton(_ sender: UIButton) {
        let currentNumber:Int = Int(currentNumberLabel.text!) ?? 0
        game.score -= game.calculateScore(currentNumber, sliderValue: slider.value.rounded(), currentNumberLabel)
                        
        if game.currentRound == 6 {
            alertControllerPerfomance()
            game.updateGameParameters(firstRound: 1, startingScore: 250)
        }
         
    }
}

