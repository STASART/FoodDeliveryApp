//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Станислав Артамонов on 2.02.24.
//


import UIKit

class OnboardingCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

