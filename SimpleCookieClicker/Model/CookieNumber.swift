//
//  CookieNumber.swift
//  SimpleCookieClicker
//
//  Created by Ohara Yoji on 2024/12/06.
//

public struct CookieNumber {
    
    public let amount: Int
    
    public init(amount: Int) {
        self.amount = amount
    }
    
    public func addCookie(_ cookieNum: CookieNumber) -> CookieNumber {
        let addedCookieNum: Int = self.amount + cookieNum.amount
        return CookieNumber(amount: addedCookieNum)
    }
    
    public func minusCookie(_ cookieNum: CookieNumber) -> CookieNumber {
        let addedCookieNum: Int = self.amount - cookieNum.amount
        return CookieNumber(amount: addedCookieNum)
    }
    
    public func multipleCookie(_ d: Double) -> CookieNumber {
        let addedCookieNum: Double = Double(self.amount) * d
        return CookieNumber(amount: Int(addedCookieNum))
    }
}
