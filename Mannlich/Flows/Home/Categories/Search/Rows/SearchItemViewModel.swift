//
//  SearchItemViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class SearchItemViewModel: ObservableObject {
    var product: Product
    @Published var isLiked: Bool
    var handler: (Int) -> Void
    
    init(product: Product, isLiked: Bool, handler: @escaping (Int) -> Void) {
        self.product = product
        self.isLiked = isLiked
        self.handler = handler
    }
}
