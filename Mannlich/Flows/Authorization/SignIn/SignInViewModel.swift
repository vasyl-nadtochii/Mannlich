//
//  SignInViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 31.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation
import Firebase

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var errorMsg = ""
    @Published var showingAlert = false
    
    @Published var showingHomeView = false
    
    let successHandler: () -> Void
    var failureHandler: (() -> Void)? = nil
    
    init(successHandler: @escaping () -> Void) {
        self.successHandler = successHandler
    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.errorMsg = error?.localizedDescription ?? ""
                self.showingAlert = true
                
                self.failureHandler!()
            } else {
                let defaults = UserDefaults.standard
                
                defaults.set(self.email.lowercased(), forKey: AuthKeys.email)
                defaults.set(self.password, forKey: AuthKeys.password)
                
                self.successHandler()
            }
        }
    }
}
