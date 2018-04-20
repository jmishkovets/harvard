//
//  ThemeChooserViewController.swift
//  Concentration
//
//  Created by Julia on 20.04.18.
//  Copyright © 2018 Julia. All rights reserved.
//

import UIKit

class ThemeChooserViewController: UIViewController {
    
    let themes = [
        "Sports" : "🏋️‍♂️🥊⚽️🏀🏈⚾️🎾🏐⛳️🏉",
        "Animals" : "🐶🦊🙈🐴🐌🐤🐼🐹🐭🐯",
        "Faces" : "👳‍♀️💆‍♀️🙅‍♂️👷‍♂️👨‍👧👶😂😅😉😏",
        "Halloween" : "👻🎃🍎🍭🙀🙈👹👺👿🧣"
    ]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIButton else { return }
        
        if segue.identifier == "Choose Theme" {
            if let themeName = button.currentTitle, let theme = themes[themeName] {
                if let concentrationViewController = segue.destination as? ConcentrationViewController {
                    concentrationViewController.theme = theme
                }
            }
        }
    }

}
