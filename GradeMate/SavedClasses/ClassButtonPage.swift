import UIKit
import FlatUIKit

class ClassButtonPage: UIView {
    @IBOutlet weak var button1: FUIButton!
    @IBOutlet weak var button2: FUIButton!
    @IBOutlet weak var button3: FUIButton!
    @IBOutlet weak var button4: FUIButton!
    @IBOutlet weak var button5: FUIButton!

    let USER_DEFAULTS_KEY_FOR_CURRENTLY_SELECTED_CLASS = "selectedClass"
    let USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS  = "alreadyRolledToClass"

    let defaultButtonColor       = UIColor.turquoise()
    let defaultButtonShadowColor = UIColor.greenSea()

    let activeButtonColor       = UIColor.concrete()
    let activeButtonShadowColor = UIColor.asbestos()

    let userDefaults = UserDefaults.standard

    fileprivate func setSelectedClass(_ sender: FUIButton) {
        if userDefaults.object(forKey: USER_DEFAULTS_KEY_FOR_CURRENTLY_SELECTED_CLASS) == nil {
            userDefaults.set(-1, forKey: USER_DEFAULTS_KEY_FOR_CURRENTLY_SELECTED_CLASS)
            userDefaults.set(true, forKey: USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS)
        } else {
            let buttonTextToInt = convertStringWithPercentToInt(value: sender.titleLabel?.text!)
            userDefaults.set(buttonTextToInt, forKey: USER_DEFAULTS_KEY_FOR_CURRENTLY_SELECTED_CLASS)
            userDefaults.set(sender.buttonColor == defaultButtonColor ? true : false, forKey: USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS)
        }
    }

    public func resetAllOtherButtonColors(_ sender: FUIButton) {
        let allButtons: [FUIButton] = [
            button1,
            button2,
            button3,
            button4,
            button5
        ]

        allButtons.forEach { (button) in
            if (sender != button) {
                button.buttonColor = defaultButtonColor
                button.shadowColor = defaultButtonShadowColor
            }
        }
    }

    public func getAllButtons() -> [FUIButton] {
        return [
            button1,
            button2,
            button3,
            button4,
            button5
        ]
    }

    fileprivate func setSelectedButtonColors(_ sender: FUIButton) {
        // FIXME: Toggle active selectedClass

        sender.buttonColor = sender.buttonColor == defaultButtonColor ? activeButtonColor : defaultButtonColor
        sender.shadowColor = sender.shadowColor == defaultButtonShadowColor ? activeButtonShadowColor : defaultButtonShadowColor

        userDefaults.set(sender.buttonColor == defaultButtonColor ? true : false, forKey: USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS)
    }

    @IBAction func buttonClicked(_ sender: FUIButton) {
        resetAllOtherButtonColors(sender)
        setSelectedButtonColors(sender)
        setSelectedClass(sender)
    }

    func convertStringWithPercentToInt(value: String?) -> Int? {
        let strIndex = value!.firstIndex(of: "%")!
        let subString = String(value![..<strIndex])

        return Int(subString)
    }
}
