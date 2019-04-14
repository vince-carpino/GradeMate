import UIKit
import FlatUIKit

class ClassButtonPage: UIView {
    @IBOutlet weak var button1: FUIButton!
    @IBOutlet weak var button2: FUIButton!
    @IBOutlet weak var button3: FUIButton!
    @IBOutlet weak var button4: FUIButton!
    @IBOutlet weak var button5: FUIButton!

//    let USER_DEFAULTS_KEY_FOR_CURRENTLY_SELECTED_CLASS = "selectedClass"
    let USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS  = "alreadyRolledToClass"

    let USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_PAGE_ID   = "selectedClassPageId"
    let USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_BUTTON_ID = "selectedClassButtonId"
    let USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_IS_ACTIVE = "selectedClassIsActive"

    let defaultButtonColor       = UIColor.turquoise()
    let defaultButtonShadowColor = UIColor.greenSea()

    let activeButtonColor       = UIColor.concrete()
    let activeButtonShadowColor = UIColor.asbestos()

    let userDefaults = UserDefaults.standard

    fileprivate func setSelectedClass(_ sender: FUIButton) {
        let selectedClassParentId = sender.parentId
        let selectedClassButtonId = sender.buttonId

        userDefaults.set(selectedClassParentId, forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_PAGE_ID)
        userDefaults.set(selectedClassButtonId, forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_BUTTON_ID)

        let alreadyRolledToClass: Bool = sender.buttonColor == defaultButtonColor ? true : false
        userDefaults.set(alreadyRolledToClass, forKey: USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS)
    }

    public func resetAllButtonColors(_ sender: FUIButton) {
        getAllButtons().forEach { (button) in
            button.buttonColor = defaultButtonColor
            button.shadowColor = defaultButtonShadowColor
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
        let selectedClassIsActive = userDefaults.bool(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_IS_ACTIVE)
        let selectedClassParentId = userDefaults.integer(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_PAGE_ID)
        let selectedClassButtonId = userDefaults.integer(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_BUTTON_ID)

        let parentIdsMatch: Bool = selectedClassParentId == sender.parentId
        let buttonIdsMatch: Bool = selectedClassButtonId == sender.buttonId
        let shouldBeActiveColor = selectedClassIsActive && parentIdsMatch && buttonIdsMatch

        sender.buttonColor = shouldBeActiveColor ? activeButtonColor : defaultButtonColor
        sender.shadowColor = shouldBeActiveColor ? activeButtonShadowColor : defaultButtonShadowColor

        let alreadyRolledToClass: Bool = sender.buttonColor == defaultButtonColor ? true : false
        userDefaults.set(alreadyRolledToClass, forKey: USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS)
    }

    fileprivate func toggleSelectedClassIsActive(_ sender: FUIButton) {
        if userDefaults.object(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_PAGE_ID) == nil {
            userDefaults.set(sender.parentId, forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_PAGE_ID)
            userDefaults.set(sender.buttonId, forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_BUTTON_ID)
        }

        let selectedClassPageId = userDefaults.integer(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_PAGE_ID)
        let selectedClassButtonId = userDefaults.integer(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_BUTTON_ID)

        let parentIdsMatch: Bool = sender.parentId == selectedClassPageId
        let buttonIdsMatch: Bool = sender.buttonId == selectedClassButtonId
        let selectedClassIsSameAsLastSelected: Bool = parentIdsMatch && buttonIdsMatch

        if (selectedClassIsSameAsLastSelected) {
            let selectedClassIsActive = userDefaults.bool(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_IS_ACTIVE)
            userDefaults.set(!selectedClassIsActive, forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_IS_ACTIVE)
        } else {
            userDefaults.set(true, forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_IS_ACTIVE)
        }
    }

    @IBAction func buttonClicked(_ sender: FUIButton) {
        print("\nACTIVE AT BEGIN? \(userDefaults.bool(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_IS_ACTIVE))")

        toggleSelectedClassIsActive(sender)
        setSelectedClass(sender)
        resetAllButtonColors(sender)
        setSelectedButtonColors(sender)

        print("CURRENTLY SELECTED CLASS ON PAGE: \(userDefaults.integer(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_PAGE_ID) + 1)")
        print("AT BUTTON: \(userDefaults.integer(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_BUTTON_ID) + 1)")
        print("ACTIVE AT END? \(userDefaults.bool(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_IS_ACTIVE))")
    }

    func convertStringWithPercentToInt(value: String?) -> Int? {
        let strIndex = value!.firstIndex(of: "%")!
        let subString = String(value![..<strIndex])

        return Int(subString)
    }
}
