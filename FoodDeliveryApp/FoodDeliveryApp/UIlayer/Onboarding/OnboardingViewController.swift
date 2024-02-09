//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Станислав Артамонов on 9.02.24.
//

import UIKit

//MARK: - OnboardingViewController
class OnboardingViewController: UIViewController {
    
    //MARK: - Properties
    private var pages = [UIViewController]()
    weak var viewOutput: OnboardingViewOutput!
    private let pageControl = UIPageControl()
    
    //MARK: - Views
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    init(pages: [UIViewController] = [UIViewController](), viewOutput: OnboardingViewOutput!) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        setupPageControl()
    }
    
    
}

//MARK: - Layout
private extension OnboardingViewController {
    func setupPageViewController() {
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers([pages.first ?? UIViewController()], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        // Установка ограничений для pageViewController.view
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        pageViewController.didMove(toParent: self)
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor  = .blue
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30) // Используйте safeAreaLayoutGuide для учёта безопасной зоны
        ])
        //        pageViewController.view.addSubview(pageControl)
        //        NSLayoutConstraint.activate([
        //            pageControl.centerXAnchor.constraint(equalTo: pageViewController.view.centerXAnchor),
        //            pageControl.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor, constant: 30)
        //        ])
    }
}

//MARK: - UIPageViewControllerDataSource
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else { return nil }
        return pages[currentIndex + 1]
    }
}
//MARK: - UIPageViewControllerDelegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    //    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
    //        if let index = pages.firstIndex(of: pendingViewControllers.first!) {
    //            pageControl.currentPage = index
    //        }
    //    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let visibleViewController = pageViewController.viewControllers?.first, let index = pages.firstIndex(of: visibleViewController) {
            pageControl.currentPage = index
        }
    }
}
