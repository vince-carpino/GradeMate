import BEMCheckBox
import FlatUIKit
import Haptica
import NightNight

class ShowLaunchScreen: UIViewController {
    @IBOutlet weak var checkBox: BEMCheckBox!
    @IBOutlet weak var background: UIImageView!

    let USER_DEFAULTS_KEY_FOR_THEME = "theme"

    var currentTheme: NightNight.Theme = .normal

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpCheckBox()

        DispatchQueue.main.asyncAfter(deadline: (.now() + 0.25)) {
            self.checkBox.setOn(true, animated: true)
            Haptic.play("-.--o", delay: 0.1)
        }

        DispatchQueue.main.asyncAfter(deadline: (.now() + 1)) {
            self.checkBox.setOn(false, animated: true)
        }

        self.perform(#selector(ShowLaunchScreen.showMainView), with: nil, afterDelay: 1.5)
    }

    func setUpCheckBox() {
        checkBox.hideBox = true
        checkBox.lineWidth = 15
        checkBox.onCheckColor = .clouds()
        checkBox.onAnimationType  = .stroke
        checkBox.offAnimationType = .fade
    }

    func setThemeAtLaunch() {
        let userDefaults = UserDefaults.standard

        if userDefaults.object(forKey: USER_DEFAULTS_KEY_FOR_THEME) == nil {
            userDefaults.set(1, forKey: USER_DEFAULTS_KEY_FOR_THEME)
        } else {
            currentTheme = userDefaults.integer(forKey: USER_DEFAULTS_KEY_FOR_THEME) == 1 ? .normal : .night
        }
    }

    func setBackgroundImageAlphaBasedOnCurrentTheme() {
        self.background.alpha = currentTheme == .normal ? 1 : 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setThemeAtLaunch()
        setBackgroundImageAlphaBasedOnCurrentTheme()
    }

    @objc func showMainView() {
        performSegue(withIdentifier: "showLaunchScreen", sender: self)
    }
}
