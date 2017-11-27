//
//  Card.swift
//  Concentration
//
//  Created by Julia on 22.11.17.
//  Copyright © 2017 Julia. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func generateUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        identifier = Card.generateUniqueIdentifier()
    }
}
