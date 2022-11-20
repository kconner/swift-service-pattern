//
//  ViewControllerA.swift
//  UIKitExampleUI
//
//  Created by Kevin Conner on 2022-11-19.
//

import UIKit

class ViewControllerA : UIViewController {
    
    @IBOutlet private var textField: UITextField!
    
    private var enteredText: String {
        textField.text ?? "n/a"
    }
    
    @IBSegueAction func prepareViewControllerC(_ coder: NSCoder) -> ViewControllerC? {
        ViewControllerC(text: enteredText, coder: coder)
    }
    
}
