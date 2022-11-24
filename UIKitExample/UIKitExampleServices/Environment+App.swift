//
//  Environment+App.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-23.
//

import Foundation

extension Environment {
    
    public func addingAppItems(message: String) -> Environment {
        self.adding(ThingService.self, item: ThingServiceImp(message: message))
            .adding(StuffService.self) { environment in
                StuffServiceImp(thingService: environment[ThingService.self])
            }
    }
    
    public var thing: ThingService {
        self[ThingService.self]
    }
    
    public var stuff: StuffService {
        self[StuffService.self]
    }
    
}
