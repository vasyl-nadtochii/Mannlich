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
            VStack(alignment: .leading) {
                viewModel.product.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .clipped()
                    .cornerRadius(15)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.product.name)
                            .font(.body.weight(.semibold))
                            .lineLimit(1)
                        Text("\(String(format: "%g", viewModel.product.price))$")
                            .lineLimit(1)
                    }
                    .padding(10)
                    
                    Spacer()
                    
                    Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                        .font(.system(size: 20))
                        .padding(6)
                        .onTapGesture {
                            viewModel.isLiked.toggle()
                            viewModel.handler(viewModel.product.id)
                        }
                }
                .padding(.top, -5)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(viewModel: SearchItemViewModel(product: MockDataManager.shared.getProducts()![3], isLiked: false, handler: { _ in }))
    }
}
