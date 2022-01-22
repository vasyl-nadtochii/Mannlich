//
//  LikedItemViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class LikedItemViewModel: ObservableObject {
    let likedProduct: Product
    
    init(likedProduct: Product) {
        self.likedProduct = likedProduct
    }
}
