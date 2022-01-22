//
//  Date.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

extension Date {
    var stringDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM. d, YYYY"
        
        return dateFormatter.string(from: self)
    }
}
