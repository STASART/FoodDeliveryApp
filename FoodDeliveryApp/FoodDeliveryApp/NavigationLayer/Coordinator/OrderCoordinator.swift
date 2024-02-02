//
//  OrderCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Станислав Артамонов on 3.02.24.
//

import Foundation
import UIKit

class OrderCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
