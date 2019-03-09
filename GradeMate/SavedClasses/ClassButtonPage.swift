import UIKit
import FlatUIKit

class ClassButtonPage: UIView {
    @IBOutlet weak var button1: FUIButton!
    @IBOutlet weak var button2: FUIButton!
    @IBOutlet weak var button3: FUIButton!
    @IBOutlet weak var button4: FUIButton!
    @IBOutlet weak var button5: FUIButton!

    @IBAction func buttonClicked(_ sender: FUIButton) {
        print ((sender.titleLabel?.text)!)
    }
}
