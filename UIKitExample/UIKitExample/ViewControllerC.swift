//
//  ViewControllerC.swift
//  UIKitExampleUI
//
//  Created by Kevin Conner on 2022-11-20.
//

import UIKit

class ViewControllerC : UIViewController {
    
    @IBOutlet private var label: UILabel!
    
    private let text: String
    
    init?(text: String, coder: NSCoder) {
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
    
}
