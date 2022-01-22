//
//  LikedViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class LikedViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    @Published var likedList: [Product]
    
    init(dataManager: DataManagerProtocol = MockDataManager()) {
        self.dataManager = dataManager
        likedList = []
    }
    
    func loadLiked() {
        likedList = []
        
        for id in dataManager.getLikedIDs()! {
            for product in dataManager.getProducts()! {
                if product.id == id {
                    likedList.append(product)
                    break
                }
            }
        }
    }
    
    func removeLiked(at position: Int) {
        dataManager.addRemoveLiked(id: likedList[position].id)
        likedList.remove(at: position)
    }
}
