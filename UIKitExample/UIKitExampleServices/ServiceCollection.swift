//
//  ServiceCollection.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public class ServiceCollectionConfiguration :
    ThingConfiguration, StuffConfiguration
{
    public let message: String
    
    public init(message: String) {
        self.message = message
    }
}

public class ServiceCollection {
    
    public let thing: ThingService
    public let stuff: StuffService
    
    public init(configuration: ServiceCollectionConfiguration) {
        thing = ThingServiceImp(
            configuration: configuration
        )
        
        stuff = StuffServiceImp(
            configuration: configuration,
            thingService: thing
        )
    }
    
}
