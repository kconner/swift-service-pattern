//
//  ServiceA.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public protocol ServiceA {
    func taskA()
}

class ServiceAImp : ServiceA {
    
    init() {}
    
    func taskA() {}
    
}
