//
//  TabBarController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import UIKit
import UIKitExampleServices

class TabBarController : UITabBarController {
    
    private var environment: (any Environment)!
    
    func configure(environment: any Environment) {
        self.environment = environment
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(environment != nil, "Expected non-nil .environment")
        
        let left = viewControllers?.first as? LeftViewController
        assert(left != nil, "Expected LeftViewController")
        left?.configure(environment: environment)
    }
    
}
