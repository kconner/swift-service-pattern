//
//  UIResponder+EnvironmentFrame.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-23.
//

import UIKit

@MainActor
public extension UIResponder {
    
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
public protocol EnvironmentFrame : UIResponder {
    
    /// In your app delegate, use this to create the root frame.
    /// Elsewhere in the responder chain, you can add items in a local scope:
    /// `lazy var localEnvironment = nextResponderEnvironment.adding(…)`
    var localEnvironment: Environment { get }
    
}
