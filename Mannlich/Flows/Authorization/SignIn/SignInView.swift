//
//  SignInView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 31.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("AuthBg")
                    .resizable()
                    .centerCropped()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()

                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                ZStack(alignment: .bottom) {
                    VStack {
                        Text("Sign In")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                            .foregroundColor(.black)
                        
                        TextField("Email", text: $email)
                            .placeholder(when: email.isEmpty) {
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
                            
                        SecureField("Password", text: $password)
                            .placeholder(when: password.isEmpty) {
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
                        print("Sign in works")
                    } label: {
                        Image(systemName: "arrow.forward")
                            .foregroundColor(.white)
                            .font(.title2)
                            .frame(width: 80, height: 80)
                    }
                    .offset(y: 40)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
