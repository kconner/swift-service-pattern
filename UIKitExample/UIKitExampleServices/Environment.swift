//
//  Environment.swift
//  UIKitExampleServices
//
//  Created by Kevin Conner on 2022-11-19.
//

import Foundation

@MainActor
public class Environment {
    
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
    private var parent: Environment?
    
    public init(parent: Environment? = nil) {
        self.parent = parent
    }
    
    public func child() -> Environment {
        Environment(parent: self)
    }
    
    public subscript<S>(_ type: S.Type) -> S {
        let key = Key(type: type)
        if let factory = items[key] {
            return factory(self) as! S
        } else if let parent {
            return parent[type]
        } else {
            fatalError("Service not registered: \(type)")
        }
    }
    
    public func add<S>(_ type: S.Type, factory: @escaping (Environment) -> S) {
        let key = Key(type: type)
        items[key] = factory
    }
    
    public func add<S>(_ type: S.Type, item: S) {
        let key = Key(type: type)
        items[key] = { _ in item }
    }
    
}

extension Environment {
    
    public func addAppItems(message: String) {
        add(ThingService.self, item: ThingServiceImp(message: message))
        
        add(StuffService.self) { environment in
            StuffServiceImp(thingService: environment[ThingService.self])
        }
    }
    
}
