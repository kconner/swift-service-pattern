//
//  ModalViewController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import UIKit
import UIKitExampleServices

class ModalViewController : UIViewController {
    
    @IBOutlet private (set) var label: UILabel!
    
    private let environment: Environment
    private let text: String
    
    init?(environment: Environment, text: String, coder: NSCoder) {
        self.environment = environment
        self.text = text
        
        super.init(coder: coder)
    }
    
    @available(*, unavailable, renamed: "init(services:text:coder:)")
    required init?(coder: NSCoder) {
        fatalError("Invalid way of decoding this class")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel()
    }
    
    func updateLabel() {
        let session = environment[LeftSession.self]
        label.text = "\(text), \(session.modalPresentationCount), \(session.doStuffCount)"
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        environment.stuff.doStuff()
        
        environment[LeftSession.self].doStuffCount += 1
        updateLabel()
    }
    
}
