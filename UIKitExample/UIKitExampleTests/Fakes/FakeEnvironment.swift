//
//  FakeEnvironment.swift
//  UIKitExampleTests
//
//  Created by Kevin Conner on 2022-11-27.
//

import Foundation
import UIKitExampleServices

final class FakeEnvironment: Environment {
    
    private let thingStorage: (any ThingService)?
    private let stuffStorage: (any StuffService)?
    
    // If these force-unwraps crash, it means you skipped faking
    // a service the test subject uses.
    var thing: any ThingService { thingStorage! }
    var stuff: any StuffService { stuffStorage! }
    
    init(
        thing: (any ThingService)? = nil,
        stuff: (any StuffService)? = nil
    ) {
        self.thingStorage = thing
        self.stuffStorage = stuff
    }
    
}
