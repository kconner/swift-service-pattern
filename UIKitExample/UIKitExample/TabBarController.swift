//
//  TabBarController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import UIKit
import UIKitExampleServices

class TabBarController : UITabBarController {
    
    private var environment = Environment()
    
    func configure(environment: Environment) {
        self.environment = environment
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftViewController = viewControllers?[0] as! LeftViewController
        leftViewController.configure(environment: environment)
    }
    
}
