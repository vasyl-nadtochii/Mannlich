//
//  MannlichApp.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI
import Firebase

@main
struct MannlichApp: App {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.userLoggedIn {
                HomeView(viewModel: HomeViewModel())
            }
            else {
                SignInView()
            }
        }
    }
}
