//
//  AdvancedInfoRow.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 16.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct AdvancedInfoRow: View {
    
    @ObservedObject var viewModel: AdvancedInfoRowViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.headerText)
                    .font(.title3)
                Text(viewModel.secondaryText)
                    .foregroundColor(.secondary)
            }
            .padding(6)
            
            Spacer()
        }
    }
}

struct AdvancedInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedInfoRow(viewModel:
                            AdvancedInfoRowViewModel(headerText: "Name Surname",
                                                     secondaryText: "test@mail.com"))
    }
}
