//
//  SignUpView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 02.02.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var progressOpacity: CGFloat = 0
    
    @ObservedObject var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(footer: Text("Fields marked with * are required to fill")) {
                        TextField("Your Name*", text: $viewModel.name)
                        TextField("Your Email*", text: $viewModel.email)
                    }
                    
                    Section(footer: Text("Your password must be at least 8 characters long")) {
                        SecureField("Your Password*", text: $viewModel.password)
                        SecureField("Repeat Your Password*", text: $viewModel.passwordConf)
                    }
                    
                    Section(footer: Text("The data you pass will be used to optimize your recommendations")) {
                        TextField("Your Street Address", text: $viewModel.street)
                        TextField("Your City", text: $viewModel.city)
                        TextField("Your State", text: $viewModel.state)
                        TextField("Your Country", text: $viewModel.country)
                    }
                }
                
                Divider()
                
                Button {
                    if !viewModel.name.isEmpty &&
                        !viewModel.email.isEmpty &&
                        !viewModel.password.isEmpty &&
                        viewModel.password == viewModel.passwordConf {
                        
                        withAnimation {
                            progressOpacity = 1
                        }
                        
                        viewModel.signUp()
                    }
                    else {
                        if viewModel.name.isEmpty ||
                            viewModel.password.isEmpty ||
                            viewModel.passwordConf.isEmpty ||
                            viewModel.email.isEmpty {
                            
                            viewModel.errorMsg = "Make sure you filled all fields"
                        }
                        else if viewModel.password != viewModel.passwordConf {
                            viewModel.errorMsg = "Make sure you entered password correctly in both fields"
                        }
                        
                        viewModel.showingAlert = true
                    }
                } label: {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .frame(width: 250, height: 50, alignment: .center)
                        .background(Color.accentColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                .padding()
                .alert(viewModel.errorMsg, isPresented: $viewModel.showingAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
            .navigationTitle("Create Account")
            .onAppear {
                viewModel.successHandler = {
                    dismiss()
                    viewModel.clearFields()
                }
                
                viewModel.failureHandler = {
                    withAnimation {
                        progressOpacity = 0
                    }
                }
            }
            .overlay(alignment: .center) {
                ZStack {
                    ProgressView()
                        .background(Color.gray.opacity(0.5).frame(width: 50, height: 50).cornerRadius(8))
                        .opacity(progressOpacity)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.dark)
    }
}
