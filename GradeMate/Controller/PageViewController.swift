//
//  PageViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 2/5/18.
//  Copyright © 2018 The Half-Blood Jedi. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    lazy var pages: [UIViewController] = {
        return [self.newVC(viewController: "buttonPage1"), self.newVC(viewController: "buttonPage2")]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self

        // This sets up the first view that will show up on our page control
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
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

    func newVC(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
}
