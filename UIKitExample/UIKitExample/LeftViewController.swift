//
//  LeftViewController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-19.
//

import UIKit
import UIKitExampleServices

class LeftViewController : UIViewController {
    
    private var environment: (any Environment)!
    
    @IBOutlet private var textField: UITextField!
    
    private var modalPresentationCount = 0
    private var doStuffCount = 0
    
    func configure(environment: any Environment) {
        self.environment = environment
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(environment != nil, "Expected non-nil .environment")
    }
    
    @IBSegueAction func presentModal(_ coder: NSCoder) -> ModalViewController? {
        modalPresentationCount += 1
        
        let enteredText = textField.text ?? "n/a"
        
        let viewController = ModalViewController(
            environment: environment,
            text: enteredText,
            coder: coder
        )
        viewController?.delegate = self
        return viewController
    }
    
}

extension LeftViewController : ModalDelegate {
    
    func modalCountString(_ modal: ModalViewController) -> String {
        "\(modalPresentationCount), \(doStuffCount)"
    }
    
    func modalDidStuff(_ modal: ModalViewController) {
        doStuffCount += 1
    }
    
}
