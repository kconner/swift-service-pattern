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

class LeftViewController : UIViewController {
    
    @IBOutlet private var textField: UITextField!
    
    private var environment = Environment()
    
    func configure(environment: Environment) {
        self.environment = environment
        self.environment.add(LeftSession.self, item: LeftSession())
    }
    
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
