//
//  ServiceCollection.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public struct ServiceCollectionConfiguration {
    public let thing: ThingServiceConfiguration
    public let stuff: StuffServiceConfiguration
    
    public init(thing: ThingServiceConfiguration, stuff: StuffServiceConfiguration) {
        self.thing = thing
        self.stuff = stuff
    }
}

public class ServiceCollection {
    
    public let thing: ThingService
    public let stuff: StuffService
    
    public init(configuration: ServiceCollectionConfiguration) {
        thing = ThingServiceImp(
            configuration: configuration.thing
        )
        
        stuff = StuffServiceImp(
            configuration: configuration.stuff,
            thingService: thing
        )
    }
    
}
