//
//  Environment+App.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import Foundation
import UIKitExampleServices

extension Environment {
    
    static let appEnvironment: Environment = {
        let environment = Environment()
        
        environment.addAppItems(message: "o hai mark")
        
        return environment
    }()
    
    var thing: ThingService {
        self[ThingService.self]
    }
    
    var stuff: StuffService {
        self[StuffService.self]
    }
    
}
