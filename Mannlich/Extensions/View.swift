//
//  View.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 31.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import Foundation
import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
