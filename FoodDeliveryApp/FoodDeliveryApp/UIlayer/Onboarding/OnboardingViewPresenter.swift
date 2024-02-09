//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Станислав Артамонов on 9.02.24.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}
class OnboardingViewPresenter: OnboardingViewOutput {
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        coordinator.finish()
    }
}
