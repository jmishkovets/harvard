//
//  ViewController.swift
//  Concentration
//
//  Created by Julia on 20.11.17.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var theme: Theme? {
        didSet {
            applyTheme()
        }
    }
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBAction func newGameClicked(_ sender: Any) {
        newGameButton.isHidden = true
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        updateViewFromModel()
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private var emojiChoices = "👻🎃🍎🍭🙀🙈"
    
    private var emoji = [Card: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }

}

// private and help functions
extension ConcentrationViewController {
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth: 2.0,
            .strokeColor: theme?.foregroundColor ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    private func updateViewFromModel() {
        guard cardButtons != nil else { return }
        
        scoreLabel.text = "Score: \(game.score)"
        
        if game.isGameCompleted {
            handleGameCompletion()
        }
        
        updateCards()
    }
    
    private func updateCards() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : theme?.foregroundColor ?? #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
            }
        }
    }
    
    private func handleGameCompletion() {
        newGameButton.isHidden = false
        flipCount = 0
    }
    
    private func applyTheme() {
        guard let theme = theme else { return }
        
        view.backgroundColor = theme.backgroundColor
        scoreLabel.textColor = theme.foregroundColor
        newGameButton.backgroundColor = theme.foregroundColor
        newGameButton.setTitleColor(theme.backgroundColor, for: .normal)
        updateFlipCountLabel()
        
        emojiChoices = theme.emojiChoices
        emoji = [:]
        updateViewFromModel()
    }
}

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

