//
//  ClassButtonsViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 2/5/18.
//  Copyright © 2018 The Half-Blood Jedi. All rights reserved.
//

import UIKit
import FlatUIKit

class ClassButtonsViewController: UIViewController {

    @IBOutlet weak var button1: FUIButton!
    @IBOutlet weak var button2: FUIButton!
    @IBOutlet weak var button3: FUIButton!
    @IBOutlet weak var button4: FUIButton!
    @IBOutlet weak var button5: FUIButton!
    @IBOutlet weak var button6: FUIButton!
    @IBOutlet weak var button7: FUIButton!
    @IBOutlet weak var button8: FUIButton!
    @IBOutlet weak var button9: FUIButton!
    @IBOutlet weak var button10: FUIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setAllButtonStyles()
    }

    @IBAction func classButtonPressed(_ sender: FUIButton) {
        print ((sender.titleLabel?.text)!)
    }

    func setAllButtonStyles() {
        switch self.restorationIdentifier! {
        case "buttonPage1":
            setButtonStyle(button: button1, buttonColor: .amethyst(), shadowColor: .wisteria())
            setButtonStyle(button: button2, buttonColor: .amethyst(), shadowColor: .wisteria())
            setButtonStyle(button: button3, buttonColor: .amethyst(), shadowColor: .wisteria())
            setButtonStyle(button: button4, buttonColor: .amethyst(), shadowColor: .wisteria())
            setButtonStyle(button: button5, buttonColor: .amethyst(), shadowColor: .wisteria())
        case "buttonPage2":
            setButtonStyle(button: button6, buttonColor: .turquoise(), shadowColor: .greenSea())
            setButtonStyle(button: button7, buttonColor: .turquoise(), shadowColor: .greenSea())
            setButtonStyle(button: button8, buttonColor: .turquoise(), shadowColor: .greenSea())
            setButtonStyle(button: button9, buttonColor: .turquoise(), shadowColor: .greenSea())
            setButtonStyle(button: button10, buttonColor: .turquoise(), shadowColor: .greenSea())
        default:
            break
        }
    }
}
