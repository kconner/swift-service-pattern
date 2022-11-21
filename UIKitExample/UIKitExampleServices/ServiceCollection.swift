//
//  ServiceCollection.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public class ServiceCollection {
    
    public class Configuration : ThingConfiguration, StuffConfiguration {
        public let message: String
        
        public init(message: String) {
            self.message = message
        }
    }
   
    public let thing: ThingService
    public let stuff: StuffService
    
    public init(configuration: Configuration) {
        thing = ThingServiceImp(
            configuration: configuration
        )
        
        stuff = StuffServiceImp(
            configuration: configuration,
            thingService: thing
        )
    }
    
}
