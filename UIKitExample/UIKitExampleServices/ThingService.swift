//
//  ThingService.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public protocol ThingService {
    func doThing()
}

public protocol ThingConfiguration {
    var message: String { get }
}

class ThingServiceImp : ThingService {
    
    let message: String
    
    init(configuration: ThingConfiguration) {
        self.message = configuration.message
    }
    
    func doThing() {
        NSLog("ThingService: \(message)")
    }
    
}
