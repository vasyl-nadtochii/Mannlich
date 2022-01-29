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
    let sizes = ["XXS", "XS", "S", "M", "L", "XL", "XXL"]
    
    let handler: (String) -> Void
    var size: String {
        didSet {
            cartProduct.size = size
            handler(cartProduct.size)
        }
    }
    
    init(cartProduct: CartProduct, handler: @escaping (String) -> Void) {
        self.cartProduct = cartProduct
        self.handler = handler
        
        size = cartProduct.size
    }
}
