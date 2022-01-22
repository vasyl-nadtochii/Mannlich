//
//  SearchItemViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class SearchItemViewModel: ObservableObject {
    @Published var product: Product
    
    init(product: Product) {
        self.product = product
    }
}
