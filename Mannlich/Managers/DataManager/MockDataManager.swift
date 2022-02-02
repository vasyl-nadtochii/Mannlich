//
//  MockDataManager.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 17.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation
import SwiftUI
import CryptoKit

class MockDataManager {
    static let shared = MockDataManager()
    
    private var user: User?
    
    private(set) var productsList: [Product]?
    private(set) var orderedProductsList: [OrderedProduct]?
    private(set) var viewedProductsList: [ViewedProduct]?
    private(set) var likedProductsIDs: [Int]?
    private(set) var cartProducts: [CartProduct]
    private(set) var announcementsList: [Announcement]?
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        productsList = [
            Product(id: 1, name: "Black Shirt", price: 30.5, image: Image("test_image")),
            Product(id: 2, name: "Black Shirt 2", price: 50, image: Image("test_image")),
            Product(id: 3, name: "Black Shirt 0", price: 60, image: Image("test_image")),
            Product(id: 4, name: "Black T-Shirt", price: 15, image: Image("test_image2")),
            Product(id: 5, name: "Black Shirt 3", price: 40, image: Image("test_image")),
            Product(id: 6, name: "Black T-Shirt 2", price: 10, image: Image("test_image2")),
            Product(id: 7, name: "Black Shirt AD", price: 30.5, image: Image("test_image")),
            Product(id: 8, name: "Black Shirt 2OR", price: 50, image: Image("test_image")),
            Product(id: 9, name: "Black Shirt NB", price: 60, image: Image("test_image")),
            Product(id: 10, name: "White T-Shirt", price: 15, image: Image("test_image2"))
        ]
        
        orderedProductsList = [
            OrderedProduct(product: productsList![0], status: .delivering, orderDate: dateFormatter.date(from: "2020-01-10")!),
            OrderedProduct(product: productsList![1], status: .awaitingShipment, orderDate: dateFormatter.date(from: "2015-11-19")!),
            OrderedProduct(product: productsList![2], status: .received, orderDate: dateFormatter.date(from: "2018-03-14")!),
            OrderedProduct(product: productsList![4], status: .received, orderDate: dateFormatter.date(from: "2022-01-10")!),
            OrderedProduct(product: productsList![5], status: .delivered, orderDate: dateFormatter.date(from: "2019-12-31")!)
        ]
        
        viewedProductsList = [
            ViewedProduct(product: productsList![6], lastViewedDate: dateFormatter.date(from: "2022-01-10")!),
            ViewedProduct(product: productsList![7], lastViewedDate: dateFormatter.date(from: "2022-01-07")!),
            ViewedProduct(product: productsList![8], lastViewedDate: dateFormatter.date(from: "2021-12-28")!),
            ViewedProduct(product: productsList![9], lastViewedDate: dateFormatter.date(from: "2022-01-18")!),
        ]
        
        cartProducts = [
            CartProduct(product: productsList![3], amount: 2, size: "XS"),
            CartProduct(product: productsList![1], amount: 1, size: "M")
        ]
        
        announcementsList = [
            Announcement(topic: "Meet 2022 with new collection",
                         content: "Placeholder",
                         date: dateFormatter.date(from: "2022-01-22")!, image: Image("test_image2")),
            Announcement(topic: "Да, я слышал про распродажи. А ты?",
                         content: "Placeholder #2",
                         date: dateFormatter.date(from: "2021-12-29")!, image: Image("gigachad"))
        ]
        
        likedProductsIDs = [1, 3, 7, 10]
        
        user = User(name: "Vasyl Nadtochii",
                    email: UserDefaults.standard.string(forKey: AuthKeys.email)!,
                    password: MD5(string: UserDefaults.standard.string(forKey: AuthKeys.password)!))
    }
}

extension MockDataManager: DataManagerProtocol {
    func addOrUpdateViewed(for product: Product, newDate: Date) {
        if let viewedList = viewedProductsList {
            for i in 0..<viewedList.count {
                if product == viewedProductsList![i].product {
                    viewedProductsList![i].lastViewedDate = newDate
                    return
                }
            }
            
            viewedProductsList!.append(ViewedProduct(product: product, lastViewedDate: newDate))
        }
    }
    
    func changeCartItemSize(id: Int, newValue: String) {
        for i in 0..<cartProducts.count {
            if cartProducts[i].product.id == id {
                cartProducts[i].size = newValue
                break
            }
        }
    }
    
    func getAnnouncements() -> [Announcement]? {
        return announcementsList
    }
    
    func changeCartItemAmount(id: Int, newValue: Int) {
        for i in 0..<cartProducts.count {
            if cartProducts[i].product.id == id {
                cartProducts[i].amount = newValue
                break
            }
        }
    }
    
    func removeFromCart(at pos: Int) {
        cartProducts.remove(at: pos)
    }
    
    func getCartProducts() -> [CartProduct] {
        return cartProducts
    }
    
    func addToCart(product: CartProduct) {
        cartProducts.append(product)
    }
    
    func getProducts() -> [Product]? {
        return productsList
    }
    
    func getLikedIDs() -> [Int]? {
        return likedProductsIDs
    }
    
    func addRemoveLiked(id: Int) {
        if likedProductsIDs!.contains(where: { $0 == id }) {
            likedProductsIDs?.removeAll(where: { $0 == id })
        } else {
            likedProductsIDs?.append(id)
        }
    }
    
    func getViewedProductList() -> [ViewedProduct]? {
        return viewedProductsList
    }
    
    func removeFromArchive(at pos: Int) {
        orderedProductsList?.remove(at: pos)
    }
    
    func getOrderedProductList() -> [OrderedProduct]? {
        return orderedProductsList
    }
    
    func changeUserData(dataType: DataType, newValue: String) {
        guard let user = user else { return }
        
        switch dataType {
        case .name:
            user.name = newValue
        case .email:
            user.email = newValue
        case .password:
            user.password = MD5(string: newValue)
        }
    }
    
    func getName() -> String? {
        guard let user = user else { return nil }
        
        return user.name
    }
    
    func getEmail() -> String? {
        guard let user = user else { return nil }
        
        return user.email
    }
    
    func getPassword() -> String? {
        guard let user = user else { return nil }
        
        return user.password
    }
}

extension MockDataManager {
    func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
