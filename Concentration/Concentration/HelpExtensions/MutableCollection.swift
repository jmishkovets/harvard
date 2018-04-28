//
//  MutableCollection.swift
//  Concentration
//
//  Created by Julia on 28.04.18.
//  Copyright © 2018 Julia. All rights reserved.
//

import Foundation

extension MutableCollection {
    
    mutating func shuffle() {
        guard count > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: count, to: 1, by: -1)) {
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
    
}
