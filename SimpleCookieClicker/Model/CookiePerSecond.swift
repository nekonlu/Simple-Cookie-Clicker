//
//  CookirPerSecond.swift
//  SimpleCookieClicker
//
//  Created by Ohara Yoji on 2024/12/06.
//

public struct CookiePerSecond {
    public let amount: Int
    
    public init(amount: Int) {
        self.amount = amount
    }
    
    public func addCookie(_ cookieNum: CookiePerSecond) -> CookiePerSecond {
        let addedCookieNum: Int = self.amount + cookieNum.amount
        return CookiePerSecond(amount: addedCookieNum)
    }
    
    public func minusCookie(_ cookieNum: CookiePerSecond) -> CookiePerSecond {
        let addedCookieNum: Int = self.amount - cookieNum.amount
        return CookiePerSecond(amount: addedCookieNum)
    }
}
