//
//  AdvancedInfoRowViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation

class AdvancedInfoRowViewModel: ObservableObject {
    var headerText: String
    var secondaryText: String
    
    init(headerText: String, secondaryText: String) {
        self.headerText = headerText
        self.secondaryText = secondaryText
    }
}
