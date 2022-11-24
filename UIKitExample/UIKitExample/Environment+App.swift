//
//  Environment+App.swift
//  UIKitExample
//
//  Created by Kevin Conner on 2022-11-20.
//

import Foundation
import UIKitExampleServices

extension Environment {
    
   static let appEnvironment = Environment().addingAppItems(message: "o hai mark")
    
    var thing: ThingService {
        self[ThingService.self]
    }
    
    var stuff: StuffService {
        self[StuffService.self]
    }
    
}
