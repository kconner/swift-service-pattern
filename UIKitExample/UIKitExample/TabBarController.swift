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
    
    private var services: TabBarServices!
    
    func configure(services: TabBarServices) {
        self.services = services
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = ServiceCollectionConfiguration(
            thing: ThingServiceConfiguration(message: "o hai mark"),
            stuff: StuffServiceConfiguration()
        )
        let services = ServiceCollection(configuration: configuration)
        
        configure(services: services)
        
        (viewControllers?[0] as! LeftViewController).configure(services: services)
    }
    
    
    
}
