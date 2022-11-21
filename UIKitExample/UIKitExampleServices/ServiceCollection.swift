//
//  Service+Shared.swift
//  UIKitExampleApp
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public class ServiceCollection {
    
    public let serviceA: ServiceA
    public let serviceB: ServiceB
    
    public init() {
        serviceA = ServiceAImp()
        serviceB = ServiceBImp(serviceA: serviceA)
    }
    
}
