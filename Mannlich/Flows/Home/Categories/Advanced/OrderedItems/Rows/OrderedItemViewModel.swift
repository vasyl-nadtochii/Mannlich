//
//  OrderedItemViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 17.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class OrderedItemViewModel: ObservableObject {
    let orderedItem: OrderedProduct
    @Published var isLiked: Bool
    var handler: (Int) -> Void
    
    init(orderedItem: OrderedProduct, isLiked: Bool, handler: @escaping (Int) -> Void) {
        self.orderedItem = orderedItem
        self.isLiked = isLiked
        self.handler = handler
    }
}
