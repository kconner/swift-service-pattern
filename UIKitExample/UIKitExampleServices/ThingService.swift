//
//  ThingService.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public protocol ThingService : Sendable {
    func doThing() async
}

actor ThingServiceImp : ThingService {
    
    private let message: String
    
    init(message: String) {
        self.message = message
    }
    
    func doThing() {
        NSLog("ThingService: \(message)")
    }
    
}
