//
//  LeftViewController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-19.
//

import UIKit
import UIKitExampleServices

class LeftSession {
    var modalPresentationCount = 0
    var doStuffCount = 0
}

class LeftViewController : UIViewController, EnvironmentFrame {
    
    @IBOutlet private var textField: UITextField!
    
    lazy var localEnvironment = {
        var env = nextEnvironment
        env.add(LeftSession.self, item: LeftSession())
        return env
    }()
    
    private var enteredText: String {
        textField.text ?? "n/a"
    }
    
    @IBSegueAction func presentModal(_ coder: NSCoder) -> ModalViewController? {
        environment[LeftSession.self].modalPresentationCount += 1
        
        return ModalViewController(
            environment: environment,
            text: enteredText,
            coder: coder
        )
    }
    
}
