//
//  SearchItemView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 22.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct SearchItemView: View {
    @ObservedObject var viewModel: SearchItemViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                viewModel.product.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .clipped()
                    
                
                ZStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(viewModel.product.name)
                                .font(.body.weight(.semibold))
                                .lineLimit(1)
                                .foregroundColor(Color("TextReversed"))
                            Text("\(String(format: "%g", viewModel.product.price))$")
                                .lineLimit(1)
                                .foregroundColor(Color("TextReversed"))
                        }
                        .padding(10)
                        
                        Spacer()
                    }
                    .background(Color("ForegroundReversed"))
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .cornerRadius(20)
        }
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(viewModel: SearchItemViewModel(product: MockDataManager.shared.getProducts()![3]))
    }
}
