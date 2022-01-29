//
//  OrderArchiveItemView.swift
//  Mannlich
//
//  Created by Vasyl Nadtochii on 18.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import SwiftUI

struct OrderArchiveItemView: View {
    
    @ObservedObject var viewModel: OrderArchiveItemViewModel
    @State var showingProductScreen = false
    
    var body: some View {
        Button {
            showingProductScreen = true
        } label: {
            HStack {
                viewModel.orderArchiveItem.product.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .cornerRadius(10)
                    .padding(6)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text(viewModel.orderArchiveItem.product.name)
                        .font(.headline)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                    Text("\(String(format: "%g", viewModel.orderArchiveItem.product.price))$")
                        .foregroundColor(.secondary)
                }
                    
                Spacer()
                
                Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                    .font(.system(size: 25))
                    .padding(6)
                    .onTapGesture {
                        viewModel.isLiked.toggle()
                        viewModel.handler(viewModel.orderArchiveItem.product.id)
                    }
            }
        }
        .sheet(isPresented: $showingProductScreen) {
            ProductView()
        }
    }
}

struct OrderArchiveItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderArchiveItemView(viewModel: OrderArchiveItemViewModel(orderArchiveItem: MockDataManager.shared.getOrderedProductList()![0], isLiked: true, handler: { _ in }))
    }
}
