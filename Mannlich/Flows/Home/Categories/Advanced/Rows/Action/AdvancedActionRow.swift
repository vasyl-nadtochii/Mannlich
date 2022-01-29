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
        Button {
            viewModel.handler()
        } label: {
            HStack {
                Image(systemName: viewModel.iconName)
                    .frame(width: 20)
                    .padding(10)
                    .foregroundColor(.secondary)
                
                Text(viewModel.type.rawValue)
                    .lineLimit(1)
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .contentShape(Rectangle())
        }
    }
}

struct AdvancedActionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .changeEmail, handler: {}))
                .previewLayout(.fixed(width: 300, height: 70))
            
            AdvancedActionRow(viewModel: AdvancedActionRowViewModel(type: .bugReport, handler: {}))
                .preferredColorScheme(ColorScheme.dark)
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
