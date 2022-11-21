//
//  TabBarController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import UIKit
import UIKitExampleServices

protocol TabBarControllerServices : ViewControllerAServices {}

extension ServiceCollection : TabBarControllerServices {}

class TabBarController : UITabBarController {
    
    private let services: TabBarControllerServices = ServiceCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (viewControllers?[0] as! ViewControllerA).configure(services: services)
    }
    
}
