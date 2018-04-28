//
//  Int.swift
//  Concentration
//
//  Created by Julia on 28.04.18.
//  Copyright © 2018 Julia. All rights reserved.
//

import Foundation

extension Int {
    
    var arc4random: Int {
        if self == 0 {
            return 0
        }
        
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
    }
    
}
