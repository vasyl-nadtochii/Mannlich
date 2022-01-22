//
//  User.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 17.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class User {
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
