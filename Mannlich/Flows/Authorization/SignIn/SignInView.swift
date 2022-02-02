//
//  SignInView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 31.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct SignInView: View {
    
    @State var bgOpacity: CGFloat = 0.5
    @State var progressOpacity: CGFloat = 0
    
    @ObservedObject var viewModel = SignInViewModel(
        successHandler: {
            if let window = UIApplication.shared.windows.first {
                window.rootViewController =
                    UIHostingController(rootView: HomeView(viewModel: HomeViewModel(dataManager: MockDataManager.shared)))
                window.makeKeyAndVisible()
            }
        })
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("AuthBg")
                        .resizable()
                        .centerCropped()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()

                    Color.black.opacity(bgOpacity)
                        .ignoresSafeArea()
                    
                    VStack {
                        ProgressView()
                            .offset(y: -60)
                            .opacity(progressOpacity)
                        
                        ZStack(alignment: .bottom) {
                            VStack {
                                Text("Sign In")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.top)
                                    .foregroundColor(.black)
                                
                                TextField("", text: $viewModel.email)
                                    .placeholder(when: viewModel.email.isEmpty) {
                                        Text("Email").foregroundColor(.gray)
                                    }
                                    .padding(5)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color.gray, lineWidth: 1))
                                    .frame(width: geometry.size.width / 1.25)
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                    .keyboardType(.emailAddress)
                                    
                                SecureField("", text: $viewModel.password)
                                    .placeholder(when: viewModel.password.isEmpty) {
                                        Text("Password").foregroundColor(.gray)
                                    }
                                    .padding(5)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color.gray, lineWidth: 1))
                                    .frame(width: geometry.size.width / 1.25)
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                
                                Button {
                                    print("Password restore works")
                                } label: {
                                    HStack {
                                        Text("Forgot password?")
                                            .foregroundColor(.blue)
                                            .padding(5)
                                        
                                        Spacer()
                                    }
                                    .frame(width: geometry.size.width / 1.25)
                                }

                                Circle()
                                    .frame(width: 80, height: 80)
                                    .padding(.bottom, -50)
                                    .padding(.top)
                                    .opacity(0)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .shadow(radius: 5))

                            Circle().foregroundColor(.black)
                                .offset(y: 40)
                                .frame(width: 80, height: 80)
                            
                            Button {
                                if !viewModel.email.isEmpty &&
                                    !viewModel.password.isEmpty {
                                    withAnimation {
                                        bgOpacity = 1
                                        progressOpacity = 1
                                        
                                        viewModel.signIn()
                                    }
                                }
                                else {
                                    viewModel.errorMsg = "Make sure you filled all fields"
                                    viewModel.showingAlert = true
                                }
                            } label: {
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .frame(width: 80, height: 80)
                            }
                            .offset(y: 40)
                            .alert(viewModel.errorMsg, isPresented: $viewModel.showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                        }
                        .offset(y: -40)
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
        .onAppear {
            viewModel.failureHandler = {
                withAnimation {
                    bgOpacity = 0.5
                    progressOpacity = 0
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
