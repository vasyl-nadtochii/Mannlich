//
//  AdvancedViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 17.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class AdvancedViewModel: ObservableObject {
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let userAgreementURL = URL(string: "http://neurosite.tilda.ws/template")
    
    var dataManager: DataManagerProtocol
    
    @Published var userName: String
    @Published var userEmail: String
    
    let defaults = UserDefaults.standard
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
        
        userName = dataManager.getName()!
        userEmail = dataManager.getEmail()!
    }
    
    func clearUserData() {
        defaults.set(nil, forKey: AuthKeys.email)
        defaults.set(nil, forKey: AuthKeys.password)
    }
    
    func changeUserData(dataType: DataType, newValue: String) {
        dataManager.changeUserData(dataType: dataType, newValue: newValue)
    }
}
