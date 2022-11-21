//
//  ServiceB.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public protocol ServiceB {
    func taskB()
}

class ServiceBImp : ServiceB {
    
    private let serviceA: ServiceA
    
    init(serviceA: ServiceA) {
        self.serviceA = serviceA
    }
    
    func taskB() {
        serviceA.taskA()
    }
    
}
