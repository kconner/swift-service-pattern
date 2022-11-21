//
//  ViewControllerA.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-19.
//

import UIKit
import UIKitExampleServices

protocol ViewControllerAServices : ViewControllerCServices {}

class ViewControllerA : UIViewController {
    
    @IBOutlet private var textField: UITextField!
    
    private var services: ViewControllerAServices!
    
    func configure(services: ViewControllerAServices) {
        self.services = services
    }
    
    private var enteredText: String {
        textField.text ?? "n/a"
    }
    
    @IBSegueAction func showC(_ coder: NSCoder) -> ViewControllerC? {
        ViewControllerC(services: services, text: enteredText, coder: coder)
    }
    
}
