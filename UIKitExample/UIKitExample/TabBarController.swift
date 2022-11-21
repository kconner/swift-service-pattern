//
//  TabBarController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import UIKit
import UIKitExampleServices

protocol TabBarServices : LeftServices {}

extension ServiceCollection : TabBarServices {}

class TabBarController : UITabBarController {
    
    private let services: TabBarServices = ServiceCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (viewControllers?[0] as! LeftViewController).configure(services: services)
    }
    
}
