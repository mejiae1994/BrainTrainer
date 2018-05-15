//
//  shuffle.swift
//  BrainTrainer
//
//  Created by Edison Mejia on 12/8/17.
//  Copyright © 2017 Donelys.familia. All rights reserved.
//

import Foundation

//found a little extension to shuffle an array
extension Array {
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
        
    }
}
