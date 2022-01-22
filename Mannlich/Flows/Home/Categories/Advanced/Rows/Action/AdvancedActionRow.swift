//
//  AdvancedRow.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct AdvancedActionRow: View {
    
    @ObservedObject var viewModel: AdvancedActionRowViewModel
    
    var body: some View {
        HStack {
            Image(systemName: viewModel.iconName)
                .frame(width: 20)
                .padding(10)
            
            Text(viewModel.type.rawValue)
                .lineLimit(1)
            
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

struct AdvancedActionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .changeEmail))
                .previewLayout(.fixed(width: 300, height: 70))
            
            AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .bugReport))
                .preferredColorScheme(ColorScheme.dark)
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
