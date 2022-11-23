//
//  LeftViewController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-19.
//

import UIKit
import UIKitExampleServices

class LeftViewController : UIViewController {
    
    @IBOutlet private var textField: UITextField!
    
    private var environment: Environment!
    
    func configure(environment: Environment) {
        self.environment = environment
    }
    
    private var enteredText: String {
        textField.text ?? "n/a"
    }
    
    @IBSegueAction func presentModal(_ coder: NSCoder) -> ModalViewController? {
        ModalViewController(
            environment: environment,
            text: enteredText,
            coder: coder
        )
    }
    
}
