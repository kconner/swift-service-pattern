//
//  TabBarController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import UIKit
import UIKitExampleServices

class TabBarController : UITabBarController {
    
    private let services = ServiceCollection()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showA":
            let child = segue.destination as! ViewControllerA
            child.configure(services: services)
        default:
            break
        }
    }
    
}

extension ServiceCollection : ViewControllerAServices {}
