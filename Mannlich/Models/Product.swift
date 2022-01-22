//
//  Product.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 17.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation
import SwiftUI

struct Product: Equatable, Identifiable {
    let id: Int
    let name: String
    let price: Double
    let image: Image
    
    init(id: Int, name: String, price: Double, image: Image) {
        self.id = id
        self.name = name
        self.price = price
        self.image = image
    }
}

struct OrderedProduct: Identifiable {
    let id: UUID
    let product: Product
    let status: OrderStatus
    let orderDate: Date
    
    init(id: UUID = UUID(), product: Product, status: OrderStatus, orderDate: Date) {
        self.id = id
        self.product = product
        self.status = status
        self.orderDate = orderDate
    }
}

extension OrderedProduct {
    enum OrderStatus: String, CaseIterable {
        case processing = "Processing"
        case awaitingShipment = "Awaiting shipment"
        case delivering = "Delivering"
        case delivered = "Delivered"
        case received = "Received"
    }
}

struct CartProduct: Identifiable {
    let id: UUID
    let product: Product
    var amount: Int
    
    init(id: UUID = UUID(), product: Product, amount: Int) {
        self.id = id
        self.product = product
        self.amount = amount
    }
}

struct ViewedProduct: Identifiable {
    let id: UUID
    let product: Product
    let lastViewedDate: Date
    
    init(id: UUID = UUID(), product: Product, lastViewedDate: Date) {
        self.id = id
        self.product = product
        self.lastViewedDate = lastViewedDate
    }
}
