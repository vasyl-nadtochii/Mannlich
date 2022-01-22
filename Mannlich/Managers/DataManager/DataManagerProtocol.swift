//
//  DataManagerProtocol.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 17.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

enum DataType {
    case name
    case email
    case password
}

protocol DataManagerProtocol {
    func getProducts() -> [Product]?
    func changeUserData(dataType: DataType, newValue: String)
    func getName() -> String?
    func getEmail() -> String?
    func getPassword() -> String?
    func getOrderedProductList() -> [OrderedProduct]?
    func removeFromArchive(at pos: Int)
    func getViewedProductList() -> [ViewedProduct]?
    func addRemoveLiked(id: Int)
    func getLikedIDs() -> [Int]?
    func getCartProducts() -> [CartProduct]
    func addToCart(product: CartProduct)
    func removeFromCart(at pos: Int)
    func changeCartItemAmount(id: Int, newValue: Int)
}
