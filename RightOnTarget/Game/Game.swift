//
//  Game.swift
//  RightOnTarget
//
//  Created by Кордюков Андрей on 12.02.23.
//

import Foundation
import UIKit

protocol GameProtocol {
    var roundCount:Int { get set }
    var currentRound:Int { get set }
    var score:Int { get set }
    
    func calculateScore(_ currentNumber:Int, sliderValue:Float,_ currentNumberLabel:UILabel) -> Int
    func updateGameParameters(firstRound currentRound:Int,startingScore score:Int)
}

class Game:GameProtocol {
    var roundCount:Int = 5
    var currentRound:Int = 1
    var score:Int = 250
        
    func calculateScore(_ currentNumber:Int, sliderValue:Float,_ currentNumberLabel:UILabel) -> Int {
        let calculatedResult = abs(currentNumber - Int(sliderValue))
        currentRound += 1
        guard currentRound != 6 else {
            currentNumberLabel.text = "End"
            return calculatedResult
        }
        currentNumberLabel.text = String(Int.random(in: 1...50))
        return calculatedResult
    }
    
    func updateGameParameters(firstRound currentRound:Int,startingScore score:Int){
        self.currentRound = currentRound
        self.score = score
    }
}
