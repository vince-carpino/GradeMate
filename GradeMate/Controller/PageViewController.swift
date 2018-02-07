//
//  PageViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 2/5/18.
//  Copyright © 2018 The Half-Blood Jedi. All rights reserved.
//

import UIKit
import CHIPageControl

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    lazy var pages: [UIViewController] = {
        return [self.newVC(name: "buttonPage1"), self.newVC(name: "buttonPage2")]
    }()

    var pageControl = UIPageControl()
    var customPC    = CHIPageControlAji()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self

        // This sets up the first view that will show up on our page control
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }

        configurePageControl()
//        configureCustomPageControl()

//        print (pageControl.layer.position)
//        print (customPC.layer.position)
    }

    // MARK: Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        pageControl.currentPage = pages.index(of: pageContentViewController)!
//        customPC.set(progress: pages.index(of: pageContentViewController)!, animated: true)
    }

    // MARK: Data source functions.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1

        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
//            return pages.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
             return nil
        }

        guard pages.count > previousIndex else {
            return nil
        }

        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else {
            return nil
        }

        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = pages.count

        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
//            return pages.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
             return nil
        }

        guard orderedViewControllersCount > nextIndex else {
            return nil
        }

        return pages[nextIndex]
    }

    // MARK: HELPER METHODS

    func newVC(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }

    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
        pageControl.center.x = self.view.center.x
        pageControl.center.y = 303
        self.pageControl.numberOfPages = pages.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = .white
        self.pageControl.pageIndicatorTintColor = .black
        self.pageControl.currentPageIndicatorTintColor = .white
        self.view.addSubview(pageControl)
    }

    func configureCustomPageControl() {
        self.customPC = CHIPageControlAji(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
        self.customPC.center.x = self.view.center.x
        self.customPC.center.y = 303
        self.customPC.numberOfPages = pages.count
        self.customPC.tintColor = .black
        self.customPC.radius = 4
        self.customPC.currentPageTintColor = .white
        self.customPC.padding = 6
    }
}
