//
//  ViewedItemViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 18.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class ViewedItemViewModel: ObservableObject {
    var viewedItem: ViewedProduct
    
    @Published var isLiked: Bool
    @Published var lastViewedDate: Date {
        didSet {
            viewedItem.lastViewedDate = lastViewedDate
        }
    }
    
    var handler: (Int) -> Void
    var dateHandler: (Date) -> Void
    
    init(viewedItem: ViewedProduct, isLiked: Bool,
         handler: @escaping (Int) -> Void,
         dateHandler: @escaping (Date) -> Void) {
        
        self.viewedItem = viewedItem
        self.isLiked = isLiked
        self.handler = handler
        self.dateHandler = dateHandler
        
        lastViewedDate = viewedItem.lastViewedDate
    }
}
