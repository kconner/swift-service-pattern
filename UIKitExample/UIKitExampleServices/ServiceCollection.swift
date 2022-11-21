//
//  ServiceCollection.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public class ServiceCollection {
    
    public let thing: ThingService
    public let stuff: StuffService
    
    public init() {
        thing = ThingServiceImp()
        stuff = StuffServiceImp(thingService: thing)
    }
    
}
