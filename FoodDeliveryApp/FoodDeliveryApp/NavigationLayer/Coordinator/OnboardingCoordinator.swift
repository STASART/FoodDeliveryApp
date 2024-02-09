//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Станислав Артамонов on 2.02.24.
//


import UIKit

class OnboardingCoordinator: Coordinator {
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        let firstVc = UIViewController()
        firstVc.view.backgroundColor = .purple
        
        let secondVc = UIViewController()
        secondVc.view.backgroundColor = .yellow
        
        let thirdVc = UIViewController()
        thirdVc.view.backgroundColor = .red
        
        [firstVc, secondVc, thirdVc].forEach { pages.append($0) }
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
