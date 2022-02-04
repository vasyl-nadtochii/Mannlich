//
//  SignUpViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 02.02.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation
import Firebase

class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConf = ""
    
    @Published var errorMsg = ""
    @Published var showingAlert = false
    
    // TODO: will be used in future updates
    @Published var street = ""
    @Published var city = ""
    @Published var state = ""
    @Published var country = ""
    
    var successHandler: (() -> Void)? = nil
    var failureHandler: (() -> Void)? = nil
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                self.successHandler!()
            }
            else {
                self.errorMsg = error?.localizedDescription ?? ""
                self.showingAlert = true
            }
        })
    }
    
    func clearFields() {
        name = ""
        email = ""
        password = ""
        passwordConf = ""
        
        street = ""
        city = ""
        state = ""
        country = ""
    }
}
