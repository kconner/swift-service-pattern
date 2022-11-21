//
//  LeftViewController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-19.
//

import UIKit
import UIKitExampleServices

protocol LeftServices : ModalServices {}

class LeftViewController : UIViewController {
    
    @IBOutlet private var textField: UITextField!
    
    private var services: LeftServices!
    
    func configure(services: LeftServices) {
        self.services = services
    }
    
    private var enteredText: String {
        textField.text ?? "n/a"
    }
    
    @IBSegueAction func presentModal(_ coder: NSCoder) -> ModalViewController? {
        ModalViewController(services: services, text: enteredText, coder: coder)
    }
    
}
