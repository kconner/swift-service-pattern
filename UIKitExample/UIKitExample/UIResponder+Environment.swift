//
//  EnvironmentFrame.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-23.
//

import UIKit
import UIKitExampleServices

extension UIResponder {
    
    @MainActor
    var environment: Environment {
        if let frame = self as? EnvironmentFrame {
            return frame.localEnvironment
        }
    
        return nextEnvironment
    }
    
    @MainActor
    var nextEnvironment: Environment {
        next?.environment ?? Environment()
    }
}

protocol EnvironmentFrame : UIResponder {
    @MainActor
    var localEnvironment: Environment { get }
}
