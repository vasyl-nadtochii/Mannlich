//
//  ViewedItemViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 18.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class ViewedItemViewModel: ObservableObject {
    let viewedItem: ViewedProduct
    @Published var isLiked: Bool
    var handler: (Int) -> Void
    
    init(viewedItem: ViewedProduct, isLiked: Bool, handler: @escaping (Int) -> Void) {
        self.viewedItem = viewedItem
        self.isLiked = isLiked
        self.handler = handler
    }
}
