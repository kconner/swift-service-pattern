//
//  StuffService.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public protocol StuffService {
    func doStuff()
}

public protocol StuffConfiguration {}

class StuffServiceImp : StuffService {
    
    private let thingService: ThingService
    
    init(configuration: StuffConfiguration, thingService: ThingService) {
        self.thingService = thingService
    }
    
    func doStuff() {
        thingService.doThing()
    }
    
}
