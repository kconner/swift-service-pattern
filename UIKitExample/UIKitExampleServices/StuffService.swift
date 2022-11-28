//
//  StuffService.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

@MainActor
public protocol StuffService : Sendable {
    func doStuff()
}

final class StuffServiceImp : StuffService {
    
    private let thingService: any ThingService
    
    init(thingService: any ThingService) {
        self.thingService = thingService
    }
    
    func doStuff() {
        Task {
            try await Task.sleep(for: .milliseconds(250))
            await self.thingService.doThing()
        }
    }
    
}
