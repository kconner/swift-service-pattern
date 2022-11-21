//
//  StuffService.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public struct StuffServiceConfiguration {
    public init() {}
}

public protocol StuffService {
    func doStuff()
}

class StuffServiceImp : StuffService {
    
    private let thingService: ThingService
    
    init(configuration: StuffServiceConfiguration, thingService: ThingService) {
        self.thingService = thingService
    }
    
    func doStuff() {
        thingService.doThing()
    }
    
}
