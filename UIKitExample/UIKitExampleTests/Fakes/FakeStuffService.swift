//
//  FakeStuffService.swift
//  UIKitExampleTests
//
//  Created by Kevin Conner on 2022-11-23.
//

import Foundation
import UIKitExampleServices

final class FakeStuffService : StuffService {
    
    var doStuffCount = 0
    
    func doStuff() {
        doStuffCount += 1
    }
    
}
