//
//  HomeViewModel.swift
//  SimpleCookieClicker
//
//  Created by Ohara Yoji on 2025/01/10.
//

import Combine
import SwiftUI

public class HomeViewModel: ObservableObject {
    
    private let gameManager = GameManager.shared
    private var timerCancellable: AnyCancellable?
    
    @Published public private(set) var cookies = CookieNumber(amount: 0)
    @Published public private(set) var production = CookiePerSecond(amount: 0)
    @Published public private(set) var allItem: [Item] = []
    
    public init() {
        self.gameManager.startGame()
        self.startAutoProduction()
        self.allItem = gameManager.items
    }
    
    public func clickCookie() {
        gameManager.clickCookie()
        updatePublishedValue()
    }
    
    public func buyItem(itemId: String) {
        self.gameManager.buyItem(itemId: itemId)
        self.updatePublishedValue()
    }
    
    private func startAutoProduction() {
        timerCancellable = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.gameManager.frequentlyUpdate()
                self?.updatePublishedValue()
            }
    }
    
    private func updatePublishedValue() {
        self.cookies = gameManager.cookies
        self.production = gameManager.production
    }
}
