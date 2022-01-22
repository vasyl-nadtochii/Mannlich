//
//  HomeViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class HomeViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = MockDataManager()) {
        self.dataManager = dataManager
    }
}
