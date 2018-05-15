//
//  OperationBrain.swift
//  BrainTrainer
//
//  Created by User on 12/4/17.
//  Copyright © 2017 Donelys.familia. All rights reserved.
//

import UIKit

class OperationBrain{
   
    public var win: Bool = false
    public var lose: Bool = false
    public var startGame = false
    private var potentialAnswers = [Int]()
    private var answer: Int = 0
    private var answerForLabel: String = ""
    private var state: String = ""
    private var numberA: Int = 0
    private var numberB: Int = 0
    private var score = 0
    private var tries = 5
    public var gameOver = false
    
    //Sets the state for the game type
    public func setState(_ whichState: String) {
        self.state = whichState
        print("this is the \(state)")
    }
    
    public func start() {
        if(!gameOver) {
            potentialAnswers.removeAll()
            twoRandNums()
            performOp()
            getProblem()
            fillAnswerArray()
        }
    }
    
    public func resetGame() {
        gameOver = false
        score = 0
        tries = 5
    }
    
    //return array of nums to choose from
    public func returnArray() -> Array<Int>{
        return potentialAnswers
    }
    
    //sets the appropiate label
    private func getProblem() {
        switch state {
        case "Addition":
            answerForLabel = "\(numberA) + \(numberB)"
        case "Substraction":
            answerForLabel = "\(numberA) - \(numberB)"
        case "Multiplication":
            answerForLabel = "\(numberA) * \(numberB)"
        case "Division":
            answerForLabel = "\(numberA) / \(numberB)"
        default:
            print("no numbers")
            
        }
        print(answerForLabel)
    }
    
    //return the label
    public func getLabel() -> String{
        return answerForLabel
    }
    
    //creates two random numbers
    public func twoRandNums(){
        numberA = Int(arc4random_uniform(50))
        numberB = Int(arc4random_uniform(50))
    }
    
    //fills the array with 2 random numbers
    public func fillAnswerArray() {
        for _ in 0...2 {
            let randNumber = Int(arc4random_uniform(60))
            let multiNumber = Int(arc4random_uniform(500))
            if state == "Multiplication" {
                potentialAnswers.append(multiNumber)
            } else {
                potentialAnswers.append(randNumber)
            }
        }
        print(potentialAnswers)
        potentialAnswers.shuffle()
        print("\(potentialAnswers) after shuffle")
    }
    
    public func performOp() {
        let operation: String = state
        if let whichAnswer = OperationDictionary[operation] {
            switch whichAnswer {
            case .binaryOperation(let theAnswer):
                answer = theAnswer(numberA, numberB)
                potentialAnswers.append(answer)
                print(answer)
            }
        }
    }
    
    public func getAnswer() -> String {
        return String(answer)
    }
    
    public func getTries() -> String {
        return String(tries)
    }
    
    public func getScore() -> String {
        return String(score)
    }
    
    private var accomulator = 0.0
    private var trankingString = ""
    
    var description: String{
        get {
            return trankingString
        }
    }
    
    public func winGame() {
        win = true
        score += 1
        self.start()
        print("testing it works")
    }
    
    public func loseGame() {
        lose = true
        tries -= 1
        self.start()
        if(tries == 0) {
            gameOver = true
            tries = 0
        }
    }
    
    private enum Operation{
        case binaryOperation((Int, Int)-> Int)
    }
    
    private var OperationDictionary: Dictionary<String, Operation> =
        [  "Addition": Operation.binaryOperation({ $0 + $1}),
           "Substraction": Operation.binaryOperation({ $0 - $1}),
           "Multiplication": Operation.binaryOperation({ $0 * $1}),
           "Division": Operation.binaryOperation({ $0 / $1}),
           ]
    
    
    private var userOperarationProcess: ProcessingOperation?
    
    private struct ProcessingOperation{
        let function:(UInt32,UInt32) ->UInt32
        let operand1:UInt32
        func performing(with operand2:UInt32)-> UInt32{
            return function (operand1,operand2)
        }
    }
}
