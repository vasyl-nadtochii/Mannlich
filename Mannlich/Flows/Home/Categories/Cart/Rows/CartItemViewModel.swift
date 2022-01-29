//
//  CartItemViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class CartItemViewModel: ObservableObject {
    @Published var cartProduct: CartProduct
    let size: String
    
    let handler: (Int) -> Void
    var amount: Int {
        didSet {
            cartProduct.amount = amount
            handler(cartProduct.amount)
        }
    }
    
    init(cartProduct: CartProduct, handler: @escaping (Int) -> Void) {
        self.cartProduct = cartProduct
        self.handler = handler
        
        amount = cartProduct.amount
        size = cartProduct.size
    }
}
