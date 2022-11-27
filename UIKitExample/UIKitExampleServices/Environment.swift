//
//  Environment.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public class Environment {
    
    public let thing: ThingService!
    public let stuff: StuffService!
    
    init(
        thing: ThingService? = nil,
        stuff: StuffService? = nil
    ) {
        self.thing = thing
        self.stuff = stuff
    }
    
    public convenience init(configuration: Configuration) {
        let thing = ThingServiceImp(message: configuration.message)
        
        let stuff = StuffServiceImp(thingService: thing)
        
        self.init(thing: thing, stuff: stuff)
    }
    
}
