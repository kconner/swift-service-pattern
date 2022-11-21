//
//  ThingService.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public struct ThingServiceConfiguration {
    let message: String
    
    public init(message: String) {
        self.message = message
    }
}

public protocol ThingService {
    func doThing()
}

class ThingServiceImp : ThingService {
    
    let message: String
    
    init(configuration: ThingServiceConfiguration) {
        self.message = configuration.message
    }
    
    func doThing() {
        NSLog("ThingService: \(message)")
    }
    
}
