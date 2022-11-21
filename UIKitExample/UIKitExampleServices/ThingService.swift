//
//  ThingService.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public protocol ThingService {
    func doThing()
}

class ThingServiceImp : ThingService {
    
    init() {}
    
    func doThing() {}
    
}
