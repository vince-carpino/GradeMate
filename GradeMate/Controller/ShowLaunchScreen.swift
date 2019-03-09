import BEMCheckBox
import FlatUIKit

class ShowLaunchScreen: UIViewController {
    @IBOutlet weak var checkBox: BEMCheckBox!
    @IBOutlet weak var background: UIImageView!

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpCheckBox()

        DispatchQueue.main.asyncAfter(deadline: (.now() + 0.25)) {
            self.checkBox.setOn(true, animated: true)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        background.image = UIImage(named: "matte-grey")
    }

    @objc func showMainView() {
        performSegue(withIdentifier: "showLaunchScreen", sender: self)
    }
}
