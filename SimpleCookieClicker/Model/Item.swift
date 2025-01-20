//
//  Item.swift
//  SimpleCookieClicker
//
//  Created by Ohara Yoji on 2025/01/10.
//

import Foundation

public struct Item: Identifiable {
    
    public let id: String
    public let name: String
    public let imagePath: String
    public let baseFee: CookieNumber
    public let baseProduction: CookiePerSecond
    public private(set) var level: Int
    
    public init(
        id: String,
        name: String,
        imagePath: String,
        baseFee: CookieNumber,
        baseProduction: CookiePerSecond,
        level: Int = 0
    ) {
        self.id = id
        self.name = name
        self.imagePath = imagePath
        self.baseFee = baseFee
        self.baseProduction = baseProduction
        self.level = level
    }
    
    public var nextLevelFee: CookieNumber {
        let rate = pow(1.15, Double(level))
        let resultFee = baseFee.multipleCookie(rate)
        return resultFee
    }
    
    public func update(level: Int) -> Item {
        Item(
            id: id,
            name: name,
            imagePath: imagePath,
            baseFee: baseFee,
            baseProduction: baseProduction,
            level: level
        )
    }
    
    public func levelUp() -> Item {
        Item(
            id: id,
            name: name,
            imagePath: imagePath,
            baseFee: baseFee,
            baseProduction: baseProduction,
            level: level + 1
        )
    }
}
