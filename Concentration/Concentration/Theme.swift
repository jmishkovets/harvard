//
//  Theme.swift
//  Concentration
//
//  Created by Julia on 28.04.18.
//  Copyright © 2018 Julia. All rights reserved.
//
import UIKit

enum Theme: Int {
    
    case sports
    case animals
    case faces
    case halloween
    
    static let count: Int = {
        var max: Int = 0
        while let _ = Theme(rawValue: max) { max += 1}
        return max
    }()
    
    var foregroundColor: UIColor {
        switch self {
            case .sports:
                return #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
            case .animals:
                return #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
            case .faces:
                return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            case .halloween:
                return #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }
    }
        
    var backgroundColor: UIColor {
        switch self {
            case .sports:
                return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            case .animals:
                return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            case .faces:
                return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            case .halloween:
                return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
        
    var emojiChoices: String {
        switch self {
            case .sports:
                return "🏋️‍♂️🥊⚽️🏀🏈⚾️🎾🏐⛳️🏉"
            case .animals:
                return "🐶🦊🙈🐴🐌🐤🐼🐹🐭🐯"
            case .faces:
                return "👳‍♀️💆‍♀️🙅‍♂️👷‍♂️👨‍👧👶😂😅😉😏"
            case .halloween:
                return "👻🎃🍎🍭🙀🙈👹👺👿🧣"
        }
    }
    
    var title: String {
        switch self {
            case .sports:
                return "Sports"
            case .animals:
                return "Animals"
            case .faces:
                return "Faces"
            case .halloween:
                return "Halloween"
        }
    }
    
    static func themeByTitle(title: String) -> Theme? {
        switch title {
            case "Sports":
                return .sports
            case "Animals":
                return .animals
            case "Faces":
                return .faces
            case "Halloween":
                return .halloween
            default:
                return nil
        }
    }

}
