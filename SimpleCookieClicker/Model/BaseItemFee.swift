//
//  BaseItemFee.swift
//  SimpleCookieClicker
//
//  Created by Ohara Yoji on 2024/12/06.
//

import Foundation

public struct BaseItemFee {
    
    public let baseItem: BaseItem
    public let baseFee: CookieNumber
    public let level: Int
    
    public var fee: CookieNumber {
        let rate = pow(1.15, Double(level))
        let resultFee = baseFee.multipleCookie(rate)
        return resultFee
    }
    
    public init(baseItem: BaseItem, baseFee: CookieNumber, level: Int) {
        self.baseItem = baseItem
        self.baseFee = baseFee
        self.level = level
    }
}
