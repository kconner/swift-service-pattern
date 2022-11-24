//
//  UIResponder+Environment.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-23.
//

import UIKit
import UIKitExampleServices

@MainActor
extension UIResponder {
    
    var environment: Environment {
        if let frame = self as? EnvironmentFrame {
            return frame.localEnvironment
        }
    
        return nextResponderEnvironment
    }
    
    var nextResponderEnvironment: Environment {
        next?.environment ?? Environment()
    }
    
}

@MainActor
protocol EnvironmentFrame : UIResponder {
    
    /// To inherit a parent environment and add to it locally:
    /// `lazy var localEnvironment = nextResponderEnvironment.adding(…)`
    var localEnvironment: Environment { get }
    
}
