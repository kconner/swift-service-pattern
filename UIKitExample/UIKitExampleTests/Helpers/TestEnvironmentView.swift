//
//  TestEnvironmentView.swift
//  UIKitExampleTests
//
//  Created by Kevin Conner on 2022-11-23.
//

import UIKit
@testable import UIKitExample
import UIKitExampleServices

/// An environment-providing superview for test subjects
class TestEnvironmentView : UIView, EnvironmentFrame {
    
    let localEnvironment: Environment
    
    init(environment: Environment) {
        localEnvironment = environment
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported initializer")
    }
    
}

extension Environment {
    
    @MainActor
    func view() -> TestEnvironmentView {
        TestEnvironmentView(environment: self)
    }
    
}
