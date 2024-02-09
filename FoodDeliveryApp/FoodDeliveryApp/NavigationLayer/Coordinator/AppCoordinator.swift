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
        //showMainFlow()
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
        guard let navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordintator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        homeCoordintator.finishDelegate = self
        homeCoordintator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordintator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        orderCoordintator.finishDelegate = self
        orderCoordintator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordintator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 2)
        listCoordintator.finishDelegate = self
        listCoordintator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordintator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 3)
        profileCoordintator.finishDelegate = self
        profileCoordintator.start()
        
        addChildCoordinator(homeCoordintator)
        addChildCoordinator(orderCoordintator)
        addChildCoordinator(listCoordintator)
        addChildCoordinator(profileCoordintator)
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        navigationController.pushViewController(tabBarController, animated: true)
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
