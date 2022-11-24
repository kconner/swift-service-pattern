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
    
    @IBOutlet private(set) var label: UILabel!
    
    private let text: String
    
    weak var delegate: ModalDelegate?
    
    init?(text: String, coder: NSCoder) {
        self.text = text
        
        super.init(coder: coder)
    }
    
    @available(*, unavailable, renamed: "init(ext:coder:)")
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
