//
//  Environment.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

public struct Environment {
    
    private struct Key: Equatable, Hashable {
        let type: Any.Type
        
        static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.type == rhs.type
        }
        
        func hash(into hasher: inout Hasher) {
            ObjectIdentifier(type).hash(into: &hasher)
        }
    }
    
    private var items: [Key : (Environment) -> Any] = [:]
    
    public init() {}
    
    public subscript<S>(_ type: S.Type) -> S {
        let key = Key(type: type)
        guard let factory = items[key] else {
            fatalError("Not in environment: \(type)")
        }
        
        return factory(self) as! S
    }
    
    public func adding<S>(_ type: S.Type, item: S) -> Environment {
        adding(type) { _ in item }
    }
    
    public func adding<S>(_ type: S.Type, factory: @escaping (Environment) -> S) -> Environment {
        let key = Key(type: type)
        
        var copy = self
        copy.items[key] = factory
        return copy
    }
    
}
