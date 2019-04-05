import UIKit
import FlatUIKit

class ClassButtonPage: UIView {
    @IBOutlet weak var button1: FUIButton!
    @IBOutlet weak var button2: FUIButton!
    @IBOutlet weak var button3: FUIButton!
    @IBOutlet weak var button4: FUIButton!
    @IBOutlet weak var button5: FUIButton!

    let CURRENTLY_SELECTED_CLASS_KEY = "selectedClass"
    let userDefaults = UserDefaults.standard

    @IBAction func buttonClicked(_ sender: FUIButton) {
//        print ((sender.titleLabel?.text)!)

        if userDefaults.object(forKey: CURRENTLY_SELECTED_CLASS_KEY) == nil {
            userDefaults.set(-1, forKey: CURRENTLY_SELECTED_CLASS_KEY)
        } else {
            let buttonText = sender.titleLabel?.text!
            let strIndex = buttonText!.firstIndex(of: "%")!
            let subString = String(buttonText![..<strIndex])
            let itemTextInt = Int(subString)

            userDefaults.set(itemTextInt, forKey: CURRENTLY_SELECTED_CLASS_KEY)

            print("SET TO:", itemTextInt!)
        }
    }
    }
}
