//
//  ContentView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct HomeView: View {
    
    @State private var selection: Tab = .novelties
    @ObservedObject var viewModel: HomeViewModel
    
    enum Tab {
        case novelties
        case search
        case cart
        case liked
        case advanced
    }
    
    var body: some View {
        TabView(selection: $selection) {
            NoveltiesView()
                .tabItem {
                    Label("Novelties", systemImage: "list.star")
                }
                .tag(Tab.novelties)
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
            
            CartView(viewModel: CartViewModel(dataManager: viewModel.dataManager))
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
                .tag(Tab.cart)
            
            LikedView(viewModel: LikedViewModel(dataManager: viewModel.dataManager))
                .tabItem {
                    Label("Liked", systemImage: "heart.fill")
                }
                .tag(Tab.liked)

            AdvancedView(viewModel: AdvancedViewModel(dataManager: viewModel.dataManager))
                .tabItem {
                    Label("Advanced", systemImage: "person.fill")
                }
                .tag(Tab.advanced)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(dataManager: MockDataManager()))
    }
}
