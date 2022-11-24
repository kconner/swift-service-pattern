//
//  LeftViewController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-19.
//

import UIKit
import UIKitExampleServices

private class LeftSession {
    var modalPresentationCount = 0
    var doStuffCount = 0
}

class LeftViewController : UIViewController {
    
    @IBOutlet private var textField: UITextField!
    
    private var session = LeftSession()
    
    private var enteredText: String {
        textField.text ?? "n/a"
    }
    
    @IBSegueAction func presentModal(_ coder: NSCoder) -> ModalViewController? {
        session.modalPresentationCount += 1
        
        let viewController = ModalViewController(text: enteredText, coder: coder)
        viewController?.delegate = self
        return viewController
    }
    
}

extension LeftViewController : ModalDelegate {
    
    var modalSessionDescription: String {
        "\(session.modalPresentationCount), \(session.doStuffCount)"
    }
    
    func modalDidStuff() {
        session.doStuffCount += 1
    }
    
}
