//
//  OrderArchiveItemViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 18.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class OrderArchiveItemViewModel: ObservableObject {
    let orderArchiveItem: OrderedProduct
    @Published var isLiked: Bool
    var handler: (Int) -> Void
    
    init(orderArchiveItem: OrderedProduct, isLiked: Bool, handler: @escaping (Int) -> Void) {
        self.orderArchiveItem = orderArchiveItem
        self.isLiked = isLiked
        self.handler = handler
    }
}
