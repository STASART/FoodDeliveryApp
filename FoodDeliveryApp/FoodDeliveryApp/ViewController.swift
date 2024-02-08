//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Станислав Артамонов on 2.02.24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Aaaa")
        view.backgroundColor = AppColors.background
        let label = UILabel()
        label.text = "Hello World!"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20)
        ])
        
        label.font = .Roboto.bold.size(of: 40)
        
        label.textColor = AppColors.accentOrange
    }
}

