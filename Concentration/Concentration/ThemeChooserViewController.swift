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
    
    private var lastSequedToConcentrationViewController: ConcentrationViewController?
    
    @IBAction func changeTheme(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
    
        if let concentrationViewConroller = splitViewDetailConcentrationViewController {
            setThemeForViewControllerIfValid(viewController: concentrationViewConroller, button: button)
        } else if let concentrationViewConroller = lastSequedToConcentrationViewController {
            setThemeForViewControllerIfValid(viewController: concentrationViewConroller, button: button)
            navigationController?.pushViewController(concentrationViewConroller, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIButton else { return }
        
        if segue.identifier == "Choose Theme" {
            if let themeName = button.currentTitle, let theme = Theme.themeByTitle(title: themeName) {
                if let concentrationViewController = segue.destination as? ConcentrationViewController {
                    concentrationViewController.theme = theme
                    lastSequedToConcentrationViewController = concentrationViewController
                }
            }
        }
    }
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }

}

extension ThemeChooserViewController: UISplitViewControllerDelegate {
    
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

// private and help functions
extension ThemeChooserViewController {
    
    private func themeFromButtonTitle(button: UIButton) -> Theme? {
        if let themeName = button.currentTitle, let theme = Theme.themeByTitle(title: themeName) {
            return theme
        }
        
        return nil
    }
    
    private func setThemeForViewControllerIfValid(viewController: ConcentrationViewController, button: UIButton) {
        // todo: reconsider, theme selection from button title?
        if let theme = themeFromButtonTitle(button: button) {
            viewController.theme = theme
        }
    }
    
}
