//
//  ViewControllerC.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import UIKit
import UIKitExampleServices

protocol ModalServices {
    var stuff: StuffService { get }
}

class ModalViewController : UIViewController {
    
    @IBOutlet private var label: UILabel!
    
    private let services: ModalServices
    private let text: String
    
    init?(services: ModalServices, text: String, coder: NSCoder) {
        self.services = services
        self.text = text
        
        super.init(coder: coder)
    }
    
    @available(*, unavailable, renamed: "init(text:coder:)")
    required init?(coder: NSCoder) {
        fatalError("Invalid way of decoding this class")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = text
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        services.stuff.doStuff()
    }
    
}
