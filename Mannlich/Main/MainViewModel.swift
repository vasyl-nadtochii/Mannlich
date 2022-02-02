//
//  MainViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 01.02.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation
import Firebase

class MainViewModel: ObservableObject {
    
    @Published var userLoggedIn: Bool
    
    init() {
        FirebaseApp.configure()
        Analytics.setAnalyticsCollectionEnabled(true)
        
        let userInfo = UserDefaults.standard
        
        if let _ = userInfo.string(forKey: AuthKeys.email),
            let _ = userInfo.string(forKey: AuthKeys.email) {
                userLoggedIn = true
        }
        else {
            userLoggedIn = false
        }
    }
}
