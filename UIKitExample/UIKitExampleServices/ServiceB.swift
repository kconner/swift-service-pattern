//
//  ServiceB.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public class ServiceB {
    
    private let serviceA: ServiceA
    
    public init(serviceA: ServiceA) {
        self.serviceA = serviceA
    }
    
    public func taskB() {
        serviceA.taskA()
    }
    
}
