//
//  ModalViewController.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import UIKit
import UIKitExampleServices

@MainActor
protocol ModalDelegate : AnyObject {
    func modalCountString(_ modal: ModalViewController) -> String
    func modalDidStuff(_ modal: ModalViewController)
}

class ModalViewController : UIViewController {
    
    private let environment: Environment
    private let text: String
    
    @IBOutlet private var label: UILabel!
    
    weak var delegate: ModalDelegate?
    
    init?(environment: Environment, text: String, coder: NSCoder) {
        self.environment = environment
        self.text = text
        
        super.init(coder: coder)
    }
    
    @available(*, unavailable, renamed: "init(environment:text:coder:)")
    required init?(coder: NSCoder) {
        fatalError("Invalid way of decoding this class")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel()
    }
    
    func updateLabel() {
        label.text = "\(text), \(delegate?.modalCountString(self) ?? "-")"
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        environment.stuff.doStuff()
        
        delegate?.modalDidStuff(self)
        updateLabel()
    }
    
}
