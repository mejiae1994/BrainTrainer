//
//  additionViewController.swift
//  BrainTrainer
//
//  Created by User on 12/4/17.
//  Copyright © 2017 Donelys.familia. All rights reserved.
//

import UIKit

var kidsMath: OperationBrain?

class additionViewController: UIViewController {
    
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var tries: UILabel!
    
    var locationCorrectAnwer = 0
    var answer: Array<Int> = Array()
    @IBOutlet weak var countDown: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    
    @IBAction func answerButtons(_ sender: UIButton) {
        if sender.titleLabel?.text == kidsMath?.getAnswer() {
            kidsMath?.winGame()
            if (kidsMath?.gameOver == false) {
                operationLabel.text = kidsMath?.getLabel()
                assignNumbers()
                updateScore()
            }
        } else {
            kidsMath?.loseGame()
            if(kidsMath?.gameOver == false) {
                operationLabel.text = kidsMath?.getLabel()
                assignNumbers()
                updateScore()
            }
        }
        if(kidsMath?.gameOver == true) {
            gameStart.titleLabel?.text = "Retry"
            gameStart.isHidden = false
            gameStart.isEnabled = true
            kidsMath?.resetGame()
            disableButtons()
            timer.invalidate()
            time = 50
            countDown.text = String(time)
        }
        print(kidsMath?.getAnswer() ?? "didnt work")
    }
    
    @IBOutlet weak var gameStart: UIButton!
   
    @IBOutlet weak var operationLabel: UILabel!
    
    var time = 50
    var timer = Timer()
    
    func assignNumbers() {
        var potentialNumbers = [Int]()
        potentialNumbers = (kidsMath?.returnArray())!
        
        var i = 0
        for button in buttons {
            button.setTitle(String(potentialNumbers[i]), for: UIControlState.normal)
            i += 1
        }
    }
    
    func updateScore() {
        let tri = kidsMath?.getTries()
        let scores = kidsMath?.getScore()
        tries.text = "Tries: \(tri!)"
        score.text = "Score: \(scores!)"
    }
    func enableButtons() {
        for button in buttons {
            button.isEnabled = true
        }
    }
    func disableButtons() {
        for button in buttons {
            button.isEnabled = false
        }
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        kidsMath?.start()
        operationLabel.text = kidsMath?.getLabel()
        assignNumbers()
        updateScore()
        sender.isEnabled = false
        enableButtons()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(additionViewController.action), userInfo: nil, repeats: true)
        
    }
    
    func action(){
        time = time-1
        countDown.text = String(time)
        if time == 0 {
            timer.invalidate()
            gameStart.titleLabel?.text = "Retry"
            gameStart.isHidden = false
            gameStart.isEnabled = true
            kidsMath?.resetGame()
            disableButtons()
            time = 50
            countDown.text = String(time)
        
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableButtons()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
