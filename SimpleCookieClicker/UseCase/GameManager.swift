//
//  GameManager.swift
//  SimpleCookieClicker
//
//  Created by Ohara Yoji on 2024/12/13.
//

import SwiftUI

public final class GameManager {
    
    public static let shared = GameManager()
    private init() {}
    
    public private(set) var cookies = CookieNumber(amount: 0)
    public private(set) var items: [Item] = []
    public private(set) var ownedItems: [Item] = []
    public private(set) var production = CookiePerSecond(amount: 0)
    
    public func clickCookie() {
        cookies = cookies.addCookie(.init(amount: 1))
    }
    
    public func frequentlyUpdate() {
        cookies = cookies.addCookie(.init(amount: production.amount))
    }
    
    public func startGame() {
        // アイテムをファクトリ経由で生成
        let bakery = ItemFactory.createBakery()
        let farm = ItemFactory.createFarm()
        let mine = ItemFactory.createMine()
        
        // 既存リストに追加
        items = [bakery, farm, mine]
        
        // 初期クッキーを 0 にセット
        cookies = CookieNumber(amount: 0)
    }
    
    public func buyItem(itemId: String) {
        
        let item = items.first { $0.id == itemId }!
        
        guard cookies.amount >= item.nextLevelFee.amount else {
            return
        }
        
        self.cookies = self.cookies.minusCookie(item.nextLevelFee)
        self.production = self.production.addCookie(item.baseProduction)
        
        items.map { item in
            if item.id == itemId {
                return item.levelUp()
            }
            return item
        }
    }
    
    private func updateProduction() {
        production = .init(amount: 0)
        for item in ownedItems {
            production = production.addCookie(item.baseProduction)
        }
    }
}
