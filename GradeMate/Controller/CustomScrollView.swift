import UIKit

class CustomScrollView: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        myInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        myInit()
    }

    private func myInit() {
        self.delaysContentTouches = false
        self.translatesAutoresizingMaskIntoConstraints = true
    }

    override func touchesShouldCancel(in view: UIView) -> Bool {
        return view is UIControl ? true : super.touchesShouldCancel(in: view)
    }
}
