//
//  ParameterMatcher.swift
//  Cuckoo
//
//  Created by Filip Dolnik on 04.07.16.
//  Copyright © 2016 Brightify. All rights reserved.
//

public struct ParameterMatcher<T>: Matchable {
    private let matchesFunction: T throws -> Bool
    
    public init(matchesFunction: T -> Bool = { _ in true }) {
        self.matchesFunction = matchesFunction
    }
    
    public var matcher: ParameterMatcher<T> {
        return self
    }
    
    public func matches(input: T) -> Bool {
        do {
            return try matchesFunction(input)
        } catch {
            return false
        }
    }
}