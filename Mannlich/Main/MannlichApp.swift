//
//  MannlichApp.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

@main
struct MannlichApp: App {
    let userInfo = UserDefaults.standard
    
    var body: some Scene {
        WindowGroup {
            if let _ = userInfo.string(forKey: AuthKeys.email),
                let _ = userInfo.string(forKey: AuthKeys.email) {
                    HomeView(viewModel: HomeViewModel())
            }
            else {
                SignInView()
            }
        }
    }
}
