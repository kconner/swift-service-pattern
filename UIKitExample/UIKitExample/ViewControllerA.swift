//
//  ViewControllerA.swift
//  UIKitExampleUI
//
//  Created by Kevin Conner on 2022-11-19.
//

import UIKit
import UIKitExampleServices

class ViewControllerA : UIViewController {
    
    private var serviceB: ServiceB!
    
    @IBOutlet private var textField: UITextField!
    
    func inject(serviceB: ServiceB) {
        self.serviceB = serviceB
    }
    
    private var enteredText: String {
        textField.text ?? "n/a"
    }
    
    @IBSegueAction func showC(_ coder: NSCoder) -> ViewControllerC? {
        ViewControllerC(text: enteredText, coder: coder)
    }
    
}
