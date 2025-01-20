//
//  ItemFactory.swift
//  SimpleCookieClicker
//
//  Created by Ohara Yoji on 2025/01/10.
//

import Foundation

public class ItemFactory {
    public static func createBakery() -> Item {
        return Item(
            id: "grandma",
            name: "グランマ",
            imagePath: "Grandma",
            baseFee: CookieNumber(amount: 100),
            baseProduction: CookiePerSecond(amount: 1)
        )
    }
    
    public static func createFarm() -> Item {
        return Item(
            id: "farm",
            name: "農場",
            imagePath: "Farm",
            baseFee: CookieNumber(amount: 1100),
            baseProduction: CookiePerSecond(amount: 8)
        )
    }
    
    public static func createMine() -> Item {
        return Item(
            id: "mine",
            name: "鉱山",
            imagePath: "Mine",
            baseFee: CookieNumber(amount: 12000),
            baseProduction: CookiePerSecond(amount: 47)
        )
    }
}
