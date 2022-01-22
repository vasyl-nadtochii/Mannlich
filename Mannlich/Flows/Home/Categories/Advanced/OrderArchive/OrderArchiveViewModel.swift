//
//  OrderArchiveViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 18.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class OrderArchiveViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    @Published var productList: [OrderedProduct]
    
    init(dataManager: DataManagerProtocol = MockDataManager()) {
        self.dataManager = dataManager
        productList = dataManager.getOrderedProductList()!.filter { $0.status == .received }
    }
    
    func removeFromArchive(at position: Int) {
        if let dataManagerOffset = dataManager.getOrderedProductList()?.firstIndex(where: {
            $0.id == productList[position].id
        }) {
            dataManager.removeFromArchive(at: dataManagerOffset)
        }
        
        productList.remove(at: position)
    }
    
    func isLiked(orderedItem: OrderedProduct) -> Bool {
        dataManager.getLikedIDs()!.contains(where: { $0 == orderedItem.product.id })
    }
}
