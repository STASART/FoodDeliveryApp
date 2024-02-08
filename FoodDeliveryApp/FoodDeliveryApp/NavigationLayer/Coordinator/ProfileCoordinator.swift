//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Станислав Артамонов on 3.02.24.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .blue
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
