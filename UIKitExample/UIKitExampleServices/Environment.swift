//
//  Environment.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

// An Environment can be passed between tasks because it's Sendable.
// Services therefore must be Sendable. They could be immutable, or if
// they need state, they can be @MainActor and used synchronousy by views,
// or they can be actors and used only asynchronously.
// Note that a fake can only be mutable if 
public protocol Environment: Sendable {
    var thing: any ThingService { get }
    var stuff: any StuffService { get }
}

public final class EnvironmentImp: Environment {
    
    public let thing: any ThingService
    public let stuff: any StuffService
    
    @MainActor
    public init(configuration: Configuration) {
        thing = ThingServiceImp(message: configuration.message)
        stuff = StuffServiceImp(thingService: thing)
    }
    
}
