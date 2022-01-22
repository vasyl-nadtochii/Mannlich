//
//  ViewedItemsViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 18.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation
import SwiftUI

class ViewedItemsViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    @Published var productList: [ViewedProduct]
    
    init(dataManager: DataManagerProtocol = MockDataManager()) {
        self.dataManager = dataManager
        productList = dataManager.getViewedProductList()!
    }
    
    func isLiked(viewedItem: ViewedProduct) -> Bool {
        dataManager.getLikedIDs()!.contains(where: { $0 == viewedItem.product.id })
    }
}
