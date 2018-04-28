//
//  Sequence.swift
//  Concentration
//
//  Created by Julia on 28.04.18.
//  Copyright © 2018 Julia. All rights reserved.
//

import Foundation

extension Sequence {
    
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
    
}
