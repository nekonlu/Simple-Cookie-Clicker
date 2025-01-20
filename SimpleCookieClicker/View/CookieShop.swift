//
//  CookieShop.swift
//  SimpleCookieClicker
//
//  Created by Ohara Yoji on 2025/01/20.
//

import SwiftUI

struct CookieShop: View {
    
    @EnvironmentObject private var viewmodel: HomeViewModel
    
    var body: some View {
        ScrollView {
            Text("CookieShop").font(.title).bold().padding(.top, 24)
            HStack(alignment: .center) {
                Text("\(viewmodel.cookies.amount) Cookie・\(viewmodel.production.amount) CPS")
            }
            VStack(spacing: 16) {
                ForEach(viewmodel.allItem) { item in
                    HStack(spacing: 8) {
                        Image(item.imagePath)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.name).bold().font(.title2)
                            Text("\(item.nextLevelFee.amount) Cookie・\(item.baseProduction.amount) CPS")
                                .foregroundStyle(item.nextLevelFee.amount <= viewmodel.cookies.amount ? .green : .red)
                        }
                        Spacer()
                    }
                    .onTapGesture {
                        viewmodel.buyItem(itemId: item.id)
                    }
                }
            }
            .padding(24)
        }
        .foregroundStyle(.white)
        .background {
            Image("Background-Moon")
                .resizable()
                .ignoresSafeArea()
        }
        .onAppear {
            print(viewmodel.allItem)
        }
        .navigationTitle("Cookie Shop")
    }
}

