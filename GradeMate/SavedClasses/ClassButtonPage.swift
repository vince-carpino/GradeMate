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

    let userDefaults = UserDefaults.standard

    @IBAction func buttonClicked(_ sender: FUIButton) {
        if userDefaults.object(forKey: USER_DEFAULTS_KEY_FOR_CURRENTLY_SELECTED_CLASS) == nil {
            userDefaults.set(-1, forKey: USER_DEFAULTS_KEY_FOR_CURRENTLY_SELECTED_CLASS)
            userDefaults.set(true, forKey: USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS)
        } else {
            let buttonTextToInt = convertStringWithPercentToInt(value: sender.titleLabel?.text!)
            userDefaults.set(buttonTextToInt, forKey: USER_DEFAULTS_KEY_FOR_CURRENTLY_SELECTED_CLASS)
            userDefaults.set(false, forKey: USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS)
        }

        // FIXME: Toggle button color when selected, toggling active selectedClass
    }

    func convertStringWithPercentToInt(value: String?) -> Int? {
        let strIndex = value!.firstIndex(of: "%")!
        let subString = String(value![..<strIndex])

        return Int(subString)
    }
}
