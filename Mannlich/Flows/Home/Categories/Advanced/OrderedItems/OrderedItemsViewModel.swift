//
//  OrderedItemsViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 17.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class OrderedItemsViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    @Published var productList: [OrderedProduct]
    
    init(dataManager: DataManagerProtocol = MockDataManager()) {
        self.dataManager = dataManager
        productList = dataManager.getOrderedProductList()!.filter { $0.status != .received }
    }
    
    func isLiked(orderedItem: OrderedProduct) -> Bool {
        dataManager.getLikedIDs()!.contains(where: { $0 == orderedItem.product.id })
    }
}
