//
//  ThemeChooserViewController.swift
//  Concentration
//
//  Created by Julia on 20.04.18.
//  Copyright © 2018 Julia. All rights reserved.
//

import UIKit

class ThemeChooserViewController: UIViewController {
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    let themes = [
        "Sports" : "🏋️‍♂️🥊⚽️🏀🏈⚾️🎾🏐⛳️🏉",
        "Animals" : "🐶🦊🙈🐴🐌🐤🐼🐹🐭🐯",
        "Faces" : "👳‍♀️💆‍♀️🙅‍♂️👷‍♂️👨‍👧👶😂😅😉😏",
        "Halloween" : "👻🎃🍎🍭🙀🙈👹👺👿🧣"
    ]
    
    @IBAction func changeTheme(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        if let concentrationViewConroller = splitViewDetailConcentrationViewController {
            if let themeName = button.currentTitle, let theme = themes[themeName] {
                concentrationViewConroller.theme = theme
            }
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
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
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        if let concentrationViewConroller = secondaryViewController as? ConcentrationViewController {
            if concentrationViewConroller.theme != nil {
                return false
            }
        }
        return true
    }

}
