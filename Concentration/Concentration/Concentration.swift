//
//  Concentration.swift
//  Concentration
//
//  Created by Julia on 22.11.17.
//  Copyright © 2017 Julia. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    var isGameCompleted: Bool {
        get {
            // todo: use filter?
            for card in cards {
                if !card.isMatched {
                    return false
                }
            }
            
            return true
        }
    }
    
    private(set) var score = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
        }
        set {
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if !cards[index].isMatched && cards[index].flippedAtLeastOnce {
                        score -= 1
                    }
                    cards[index].flippedAtLeastOnce = true
                }
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards!")
        
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // shuffle the cards
        cards.shuffle()
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index is not in the cards!")
        
        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
                // check if cards match
                if cards[matchedIndex] == cards[index] {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
}
