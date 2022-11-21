//
//  ServiceCollection+App.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import Foundation
import UIKitExampleServices

extension ServiceCollection : TabBarServices {}

extension ServiceCollection {
    
    private (set) static var shared: ServiceCollection!
    
    static func prepare() {
        let configuration = ServiceCollection.Configuration(
            message: "o hai mark"
        )
        
        shared = ServiceCollection(configuration: configuration)
    }
    
}
