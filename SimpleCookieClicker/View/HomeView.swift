//
//  HomeView.swift
//  SimpleCookieClicker
//
//  Created by Ohara Yoji on 2025/01/06.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewmodel: HomeViewModel = .init()
    @State private var isShowingCookieShop: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 4) {
                Text("\(viewmodel.cookies.amount) Cookie!")
                    .font(.title)
                    .bold()
                Text("\(viewmodel.production.amount) CPS")
                    .font(.title3)
                    .bold()
            }
            Spacer()
            Button {
                viewmodel.clickCookie()
            } label: {
                Image("NormalCookie")
                    .resizable()
                    .frame(width: 300, height: 300)
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    isShowingCookieShop.toggle()
                } label: {
                    Image("CookieShop")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
            }
        }
        .fontDesign(.rounded)
        .padding()
        .background {
            Image("Background-Grassland")
                .resizable()
                .ignoresSafeArea()
        }
        .sheet(isPresented: $isShowingCookieShop) {
            CookieShop()
        }
        .environmentObject(viewmodel)
    }
}

#Preview {
    HomeView()
}
