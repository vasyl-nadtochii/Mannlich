//
//  AdvancedActionRowViewModel.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation

class AdvancedActionRowViewModel: ObservableObject {
    
    var type: RowType
    var iconName: String
    
    init(type: RowType) {
        self.type = type
        switch type {
        case .changeName:
            iconName = "textformat.abc"
        case .changeEmail:
            iconName = "envelope.fill"
        case .changePassword:
            iconName = "lock.fill"
        case .showOrdered:
            iconName = "dollarsign.circle.fill"
        case .showViewed:
            iconName = "eye.fill"
        case .showOrderArchive:
            iconName = "clock.badge.checkmark"
        case .contactSupport:
            iconName = "questionmark.circle.fill"
        case .logOut:
            iconName = "arrow.left.circle.fill"
        case .bugReport:
            iconName = "ladybug.fill"
        case .userAgreement:
            iconName = "info.circle.fill"
        }
    }
}

extension AdvancedActionRowViewModel {
    enum RowType: String, CaseIterable {
        case changeName = "Change Name"
        case changeEmail = "Change Email"
        case changePassword = "Change Password"
        case showOrdered = "Show Ordered Products"
        case showViewed = "Show Viewed Products"
        case showOrderArchive = "Show Order Archive"
        case contactSupport = "Contact Support"
        case logOut = "Log Out"
        case bugReport = "Bug Report"
        case userAgreement = "View User Agreement"
    }
}
