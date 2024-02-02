//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Станислав Артамонов on 2.02.24.
//

import UIKit

class AppCoordinator: Coordinator {
   
    override func start() {
        showUnboardingFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

private extension AppCoordinator {
    func showUnboardingFlow() {
        guard let navigationController = navigationController else { print("NavVc")
            return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
    
}
