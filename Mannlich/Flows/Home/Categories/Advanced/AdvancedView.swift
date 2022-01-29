//
//  AdvancedView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct AdvancedView: View {
    
    @State private var showingLogOutAlert = false
    
    @State private var showingOrderedList = false
    @State private var showingViewedList = false
    @State private var showingArchiveList = false
    
    @ObservedObject var viewModel: AdvancedViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account Settings")) {
                    AdvancedInfoRow(viewModel: AdvancedInfoRowViewModel(headerText: viewModel.userName, secondaryText: viewModel.userEmail))
                    
                    AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .changeName, handler: {
                        alertView(title: "Change Name",
                                  message: "Enter new name",
                                  placeholder: "New name",
                                  dataType: .name)
                    }))
                    
                    AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .changeEmail, handler: {
                        alertView(title: "Change Email",
                                  message: "Enter new email",
                                  placeholder: "New email",
                                  dataType: .email)
                    }))
                    
                    AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .changePassword, handler: {
                        alertView(title: "Change Password",
                                  message: "Enter new password",
                                  placeholder: "New password",
                                  secureInput: true,
                                  dataType: .password)
                    }))                }
                
                Section(header: Text("Actions")) {
                    AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .showOrdered, handler: {
                        showingOrderedList = true
                    }))
                    .sheet(isPresented: $showingOrderedList) {
                        OrderedItemsView(viewModel: OrderedItemsViewModel(dataManager: viewModel.dataManager))
                    }
                    
                    AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .showViewed, handler: {
                        showingViewedList = true
                    }))
                    .sheet(isPresented: $showingViewedList) {
                        ViewedItemsView(viewModel: ViewedItemsViewModel(dataManager: viewModel.dataManager))
                    }
                    
                    AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .showOrderArchive, handler: {
                        showingArchiveList = true
                    }))
                    .sheet(isPresented: $showingArchiveList) {
                        OrderArchiveView(viewModel: OrderArchiveViewModel(dataManager: viewModel.dataManager))
                    }
                    
                    AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .contactSupport, handler: {
                        sendEmail(to: "iangenda2209@gmail.com", topic: "Mannlich iOS - Support", body: "Ask your question here")
                    }))
                    
                    AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .logOut, handler: {
                        showingLogOutAlert = true
                    }))
                    .alert("Are you sure you want to log out?", isPresented: $showingLogOutAlert) {
                        Button("Log Out", role: .destructive) {
                            // do logout stuff
                        }
                    }
                }
                
                Section(header: Text("Other")) {
                    AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .bugReport, handler: {
                        sendEmail(to: "iangenda2209@gmail.com", topic: "Mannlich iOS - Bug Report on \(Date().stringDate)", body: "Describe your problem here")
                    }))
                    
                    AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .userAgreement, handler: {
                        guard let url = viewModel.userAgreementURL else { return }
                        UIApplication.shared.open(url)
                    }))
                    
                    AdvancedInfoRow(viewModel: AdvancedInfoRowViewModel(headerText: "Version", secondaryText: viewModel.appVersion ?? "N/A"))
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Advanced")
        }
    }
}

extension AdvancedView {
    func alertView(title: String, message: String, placeholder: String, secureInput: Bool = false, dataType: DataType) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField { (input) in
            input.isSecureTextEntry = secureInput
            input.placeholder = placeholder
        }
        
        let changeName = UIAlertAction(title: "Apply", style: .default) { (_) in
            // do some stuff
            if let newValue = alert.textFields![0].text {
                if !newValue.isEmpty {
                    viewModel.changeUserData(dataType: dataType, newValue: newValue)
                    
                    if dataType == .name {
                        viewModel.userName = newValue
                    }
                    else if dataType == .email {
                        viewModel.userEmail = newValue
                    }
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(changeName)
        alert.addAction(cancel)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
            // do stuff
        })
    }
    
    func sendEmail(to address: String, topic: String, body: String) {
        // TODO: move it to the ViewModel
        let supportEmail = address
        
        let formattedTopic = topic.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        let formattedBody = body.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        
        let stringUrl = "mailto:\(supportEmail)?subject=\(formattedTopic)&body=\(formattedBody)"
        
        if let url = URL(string: stringUrl) {
            UIApplication.shared.open(url)
        }
    }
}

struct AdvancedView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedView(viewModel: AdvancedViewModel(dataManager: MockDataManager()))
    }
}
