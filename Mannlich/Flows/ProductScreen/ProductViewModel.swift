//
//  ProductViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 29.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class ProductViewModel: ObservableObject {
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
}
