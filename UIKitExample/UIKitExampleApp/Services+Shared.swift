//
//  Service+Shared.swift
//  UIKitExampleApp
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation
import UIKitExampleServices

extension ServiceA {
    static let shared = ServiceA()
}

extension ServiceB {
    static let shared = ServiceB(
        serviceA: ServiceA.shared
    )
}
