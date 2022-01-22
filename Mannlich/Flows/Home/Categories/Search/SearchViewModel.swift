//
//  SearchViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation
import Combine

class SearchViewModel: ObservableObject {
    let dataManager: DataManagerProtocol
    @Published var searchList: [Product]
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
        searchList = dataManager.getProducts()!
    }
}
