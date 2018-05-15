//
//  ViewController.swift
//  BrainTrainer
//
//  Created by User on 12/4/17.
//  Copyright © 2017 Donelys.familia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    private var brain = OperationBrain()
    
    @IBAction func sumButton(_ sender: UIButton) {
        brain.setState((sender.titleLabel?.text!)!)
        self.performSegue(withIdentifier: "gameScreen", sender: sender)
        kidsMath = brain
    }

    @IBAction func subtButton(_ sender: UIButton) {
        brain.setState((sender.titleLabel?.text!)!)
        self.performSegue(withIdentifier: "gameScreen", sender: sender)
        kidsMath = brain
    }

    @IBAction func productButton(_ sender: UIButton) {
        brain.setState((sender.titleLabel?.text!)!)
        self.performSegue(withIdentifier: "gameScreen", sender: sender)
        kidsMath = brain
    }

    @IBAction func divisionButton(_ sender: UIButton) {
        brain.setState((sender.titleLabel?.text!)!)
        self.performSegue(withIdentifier: "gameScreen", sender: sender)
        kidsMath = brain
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

