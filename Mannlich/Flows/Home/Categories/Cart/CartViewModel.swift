//
//  CartViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class CartViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    @Published var cartList: [CartProduct]
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
        
        cartList = dataManager.getCartProducts()
    }
    
    func removeFromCart(at pos: Int) {
        dataManager.removeFromCart(at: pos)
        cartList.remove(at: pos)
    }
}
